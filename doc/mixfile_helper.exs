defmodule CanonPath.MixfileHelper do
  require Bitwise
  @default_symlinkmax 64
  @known_c_compilers  ~w{cc gcc clang}
  @maxsymlinks_src """
  #include <stdio.h>
  #include <limits.h>
  #include <sys/param.h>
  int main(void) {
      unsigned int symloop_max = #{@default_symlinkmax};
  #ifdef SYMLOOP_MAX
      symloop_max = SYMLOOP_MAX;
  #elif defined(MAXSYMLINKS)
      symloop_max = MAXSYMLINKS;
  #endif
      printf("%u\n", symloop_max);
      return 0;
  }
  """
  def get_maxsymlinks(), do: _get_maxsymlinks(:os.type, has_symlinks)

  def find_cc() do
    try do
      Enum.find_value @known_c_compilers, &find_cc_for/1
    rescue
      _ -> nil
    end
  end

  defp _get_maxsymlinks(_          , false), do: 0
  defp _get_maxsymlinks({:win32, _}, _    ), do: 63
  defp _get_maxsymlinks(_          , _    ) do
    @default_symlinkmax
  end

  defp find_cc_for(name) do
    try do
      case System.cmd("which", [name]) do
        { :error,   _ }                     -> nil
        { :ok, str, 0 } when is_binary(str) -> ensure_cc(str, name)
        { str,      0 } when is_binary(str) -> ensure_cc(str, name)
        _                                   -> nil
      end
    rescue
      _ -> nil
    end
  end

  defp ensure_cc(cc, name) do
    path = String.strip cc
    # On Solaris (at least), `which` returns status 0, even though the file
    # is not found.
    if failure_is_masked(path, name) do
      nil
    else
      # Must be a file
      if File.exists?(path) && File.regular?(path) do
        case File.stat(path) do
          {:ok, %File.Stat{mode: m}} ->
            # Must be executable
            if Bitwise.&&&(m, 0111) == 0111, do: path, else: nil
          _ -> nil
        end
      else
        nil
      end
    end
  end

  defp failure_is_masked(path, name) do
    String.match?(path, ~r/\bno\s+#{name}\s+in\s+/)
  end

  defp has_symlinks do
    case :file.read_link(__ENV__.file) do
      {:error, :enotsup} -> false
      _                  -> true
    end
  end

end

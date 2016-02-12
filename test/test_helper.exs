has_symlinks = case :file.read_link(Path.expand(__ENV__.file)) do
  {:error, :enotsup} -> false
  _                  -> true
end

{ incl_symlinks_str, tags_to_exclude } =
if has_symlinks do
  { "has_symlinks", [:todo, :os, :os_sym, :no_symlinks] }
else
  { "no_symlinks", [:todo, :os, :os_sym, :has_symlinks] }
end


# incl_symlinks_str = case :file.read_link(Path.expand(__ENV__.file)) do
#   {:error, :enotsup} -> "no_symlinks"
#   _                  -> "has_symlinks"
# end
# case :file.read_link(Path.expand(__ENV__.file)) do
#   {:error, :enotsup} -> tags_to_exclude = [:os, :os_sym, :has_symlinks]
#   _                  -> tags_to_exclude = [:os, :os_sym, :no_symlinks]
# end


this_os    = OSUtils.os_id
os_sym_tag = :"#{this_os}_#{incl_symlinks_str}"


ExUnit.configure(
  exclude: tags_to_exclude,
  include: [os: this_os, os_sym: os_sym_tag] )

ExUnit.start()


defmodule PathUtils.Case do
  use ExUnit.CaseTemplate
  @moduledoc false


  using do
    d      = __DIR__
    setup_complete = setup_complete?

    quote do
      import  unquote(__MODULE__)
      require PathUtils

      @test_os        unquote(OSUtils.os_id)
      @test_os_str    unquote(os_str)
      @test_dir       System.cwd
      @test_file      Path.relative_to_cwd(__ENV__.file)
      @test_path      Path.expand(@test_file)
      @data_dir       Path.expand(Path.join(unquote(d), "data"))
      @lib_file       Path.join(["test", "..", "lib", "canon_path.ex"])
      @orig_file      "some_file.txt"
      @link_trgt      Path.join([unquote(d), "data", @test_os_str, @orig_file])
      @rel_link       Path.join([unquote(d), "data", @test_os_str, "rel_link.txt"])
      @setup_complete unquote(setup_complete)

    end
  end

  defmacro pu_alias do
    quote do
      alias   PathUtils, as: PU
    end
  end

  defmacro refute_cwd_contains_symlink do
    quote do
      symlinks = symlinks_in_path(System.cwd) |>
        Enum.map(&("Symlink:     #{&1}"))
      msg = [
        "System.cwd must not contain symlinks:",
        "System.cwd:  #{System.cwd}" | symlinks
        ] |> Enum.join("\n        ")

      # msg = "System.cwd must not contain symlinks: #{System.cwd}"
      # refute cwd_contains_symlink?(), "System.cwd must not contain symlinks: #{System.cwd}"
      refute cwd_contains_symlink?(), msg
    end
  end

  def cwd_contains_symlink?, do: path_contains_symlink?(System.cwd)

  def path_contains_symlink?(path) do
    Enum.any? cumulative_dirs(path), &is_symlink?/1
  end

  def symlinks_in_path(p) do
    Enum.filter cumulative_dirs(p), &is_symlink?/1
  end


  # Helpers


  defp is_symlink?(p) do
    case :file.read_link(p) do
      {:ok, _} -> true
      _        -> false
    end
  end

  defp cumulative_dirs(d) do
    f = fn
      x, []          -> [x]
      x, [h|_] = acc -> [ Path.join(h, x) | acc ]
    end
    Path.split(d) |> List.foldl([], f) |> Enum.reverse
  end

  defp setup_complete? do
    known_symlink  = Path.join([__DIR__, "data", os_str, "rel_link.txt"])
    is_symlink? known_symlink
  end

  defp os_str do
    case OSUtils.os_id do
      :unix -> "posix"
      _     -> to_string OSUtils.os_id
    end
  end
end

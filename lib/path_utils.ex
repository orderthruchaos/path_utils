defmodule PathUtils do

  def maxsymlinks() do
    # Windows is known to allow 31 reparse points:
    #   http://msdn.microsoft.com/en-us/library/aa365460.aspx
    #
    # Unix limit should be obtained via:
    #   - limits.h:     SYMLINK_MAX    Cygwin
    #   - sys/param.h:  MAXSYMLINKS    Solaris
    # At this time, the largest value I have found is 32 (darwin).  Setting
    # it to 64 should leave space for error.
    #
    # See canon_path/doc/symloop_max.c for example C program for determining
    # this value.
    #
    # Unfortunately, doing this at compile time would prevent generated BEAM
    # files from being portable.

    if OSUtils.supports_symlinks? do
      case OSUtils.os_id do
        :win32 -> 31
        _      -> 64
      end
    else
      0
    end
  end

  # def symlink?(path) do
  #   case :file.read_link(path) do
  #     {:ok, _} -> true
  #     _        -> false
  #   end
  # end

  # # Deepest common directory
  # def dcd(path1, path2) do
  #   dir1 = directory(path1)
  #   dir2 = directory(path2)
  #   _dcd(dir1, dir2)
  # end

  # def directory(path), do: _directory(Path.expand(path))


  # # Helpers


  # defp _directory(path) do
  #   case File.dir?(path) do
  #     true -> path
  #     _    -> Path.dirname(path)
  #   end
  # end

  # defp _dcd(p1, p2), do:  _dcd_take(p1, p2) |> _dcd_comb

  # # [] should only happen on Windows when the drive letters differ.
  # defp _dcd_comb([]), do: nil
  # defp _dcd_comb(p),  do: Path.join(p)

  # defp _dcd_take(p1, p2) do
  #   Enum.zip(Path.split(p1), Path.split(p2))
  #     |> Enum.take_while(&(elem(&1, 0) == elem(&1, 1)))
  #     |> Enum.map(&(elem(&1, 0)))
  # end

end

defmodule PathUtils do
  @moduledoc """
  Path utilities for Elixir.

  Additional utilities that are not provided by `Path` or `:filename`.

  These are primarily shortcuts.
  """


  @doc """
  Returns true if the final portion of a path is actually a symlink.

  Symlinks may exist elsewhere in the path.  If the final portion of the path
  is actually a file, directory, etc, and not a symlink, this function will
  return false.
  """
  def symlink?(path) do
    case :file.read_link(path) do
      {:ok, _} -> true
      _        -> false
    end
  end


  @doc """
  Returns the deepest common directory of the two given paths.

  Note:  symlinks are not resolved.
  """
  def dcd(path1, path2) do
    dir1 = directory(path1)
    dir2 = directory(path2)
    _dcd(dir1, dir2)
  end


  @doc """
  The given path is first expanded via `Path.expand/1`.  Then, if the path
  is a directory, it returns the entire expanded path.  Otherwise, returns
  the directory of the expanded path via `Path.dirname/1`.
  """
  def directory(path), do: _directory(Path.expand(path))


  # Helpers


  defp _directory(path) do
    case File.dir?(path) do
      true -> path
      _    -> Path.dirname(path)
    end
  end

  defp _dcd(p1, p2), do:  _dcd_take(p1, p2) |> _dcd_comb

  # [] should only happen on Windows when the drive letters differ.
  defp _dcd_comb([]), do: nil
  defp _dcd_comb(p),  do: Path.join(p)

  defp _dcd_take(p1, p2) do
    Enum.zip(Path.split(p1), Path.split(p2))
      |> Enum.take_while(&(elem(&1, 0) == elem(&1, 1)))
      |> Enum.map(&(elem(&1, 0)))
  end

end

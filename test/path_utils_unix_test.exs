Code.require_file "test_helper.exs", __DIR__

defmodule PathUtilsUnixTest do
  use PathUtils.Case
  pu_alias


  @tag os_sym: :unix_has_symlinks
  test "Test the file properties of '#{@rel_link}'" do
    # IO.puts ""
    # IO.puts @rel_link
    # IO.puts ""
    assert File.exists?(@rel_link)
    assert @link_trgt != @rel_link
    check_link @orig_file, @rel_link
  end

  @tag os_sym: :unix_has_symlinks
  test "symlink? returns true for #{@rel_link}" do
    assert PU.symlink?(@rel_link)
  end

  @tag os_sym: :unix_no_symlinks
  test "symlink? returns false for #{@rel_link} (not supported)" do
    refute PU.symlink?(@rel_link)
  end

  @tag os: :unix
  test "Test the file properties of '#{@test_path}'" do
    # IO.puts ""
    # IO.puts @test_file
    # IO.puts @test_path
    # IO.puts ""
    assert File.exists?(@test_path)
    assert File.regular?(@test_path)
  end


  # Helpers


  defp check_link(target, link) do
    process_read_link(target, link, :file.read_link(@rel_link))
  end

  defp process_read_link(target, _link, {:ok, path}) do
    assert target == to_string(path)
  end

  defp process_read_link(target, link, _) do
    flunk "Could not read symlink: #{link} -> #{target}"
  end

end

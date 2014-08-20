Code.require_file "test_helper.exs", __DIR__

defmodule PathUtilsWin32Test do
  use PathUtils.Case
  pu_alias


  @tag os_sym: :win32_has_symlinks
  test "symlink?: rel_link is a symbolic link" do
    assert PU.symlink?(@rel_link)
  end

  @tag os_sym: :win32_no_symlinks
  test "symlink?: rel_link is not symbolic (not supported)" do
    refute PU.symlink?(@rel_link)
  end

  @tag os_sym: :win32_has_symlinks
  test "maxsymlinks output" do
    assert 31 == PU.maxsymlinks()
  end

  # # @tag os_sym: :win32_has_symlinks
  # # test "os_sym: :win32_has_symlinks" do
  # #   assert true, "os_sym: :win32_has_symlinks"
  # # end

  # # @tag os_sym: :win32_no_symlinks
  # # test "os_sym: :win32_no_symlinks" do
  # #   assert false, "os_sym: :win32_no_symlinks"
  # # end

  # # @tag os_sym: :unix_has_symlinks
  # # test "os_sym: :unix_has_symlinks" do
  # #   assert false, "os_sym: :unix_has_symlinks"
  # # end

  # # @tag os_sym: :unix_no_symlinks
  # # test "os_sym: :unix_no_symlinks" do
  # #   assert false, "os_sym: :unix_no_symlinks"
  # # end

  # @tag os: :win32
  # test "Test the file properties of '#{@test_path}'" do
  #   # IO.puts ""
  #   # IO.puts @test_file
  #   # IO.puts @test_path
  #   # IO.puts ""
  #   assert File.exists?(@test_path)
  #   assert File.regular?(@test_path)
  # end

  # @tag os: :win32
  # test "Test the file properties of '#{@rel_link}'" do
  #   # IO.puts ""
  #   # IO.puts @rel_link
  #   # IO.puts ""
  #   refute_cwd_contains_symlink
  #   assert File.exists?(@rel_link)
  #   assert @link_trgt != @rel_link
  #   check_link @link_trgt, @rel_link
  # end

  # @tag os: :win32
  # test "dcd: Drive letters differ" do
  #   assert nil === PU.dcd("C:/Windows", "D:/Windows")
  # end




  # # Helpers


  # defp check_link(target, link) do
  #   process_read_link(target, link, :file.read_link(@rel_link))
  # end

  # defp process_read_link(target, _link, {:ok, path}) do
  #   assert target == to_string(path)
  # end

  # defp process_read_link(target, link, _) do
  #   flunk "Could not read symlink: #{link} -> #{target}"
  # end
end

Code.require_file "test_helper.exs", __DIR__

defmodule PathUtilsTest do
  use PathUtils.Case
  pu_alias


  @win32_dir   Path.join(@data_dir, "win32")
  @posix_dir   Path.join(@data_dir, "posix")
  @win32_file  Path.join(@win32_dir, "some_file.txt")
  @posix_file  Path.join(@posix_dir, "some_file.txt")


  test "Test the file properties of '#{@test_path}'" do
    assert File.exists?(@test_path)
    assert File.regular?(@test_path)
  end

  test "Test the properties of the directory '#{@test_dir}'" do
    assert File.exists?(@test_dir)
    assert File.dir?(@test_dir)
  end

  test "Directory is not a symlink." do
    refute PU.symlink?(@test_dir)
  end

  test "File is not a symlink." do
    refute PU.symlink?(@test_path)
  end

  test "Basic test path properties" do
    assert File.dir?     @data_dir
    assert File.dir?     @win32_dir
    assert File.dir?     @posix_dir
    assert File.regular? @win32_file
    assert File.regular? @posix_file
  end

  test "directory:  directories" do
    assert dc(@test_dir) == dc(PU.directory(@test_dir))
    assert dc(@data_dir) == dc(PU.directory(@data_dir))

    rel_data = Path.relative_to_cwd(@data_dir)
    assert rel_data != @data_dir
    assert dc(@data_dir) == dc(PU.directory(rel_data))
  end

  test "directory:  files" do
    assert @posix_dir == PU.directory(@posix_file)

    rel_posix = Path.relative_to_cwd(@posix_file)
    assert rel_posix != @posix_file
    assert @posix_dir == PU.directory(rel_posix)
  end

  # test "dcd:  no brainers" do
  #   check_dcd_of(@test_dir, @test_dir, @test_dir)
  #   check_dcd_of(@data_dir, @data_dir, @data_dir)
  # end

  # test "dcd:  no brainers, relative dirs" do
  #   check_dcd_of_rel(@data_dir, @data_dir, @data_dir)
  # end

  # test "dcd:  directory portion of paths" do
  #   check_dcd_of(@posix_dir, @posix_file, @posix_dir)
  # end

  # test "dcd:  directory portion of relative paths" do
  #   check_dcd_of_rel(@posix_dir, @posix_file, @posix_dir)
  # end

  # test "dcd:  Differences occur earlier (1)" do
  #   check_dcd_of(@data_dir, @posix_dir, @win32_dir)
  #   check_dcd_of(@data_dir, @posix_file, @win32_dir)
  #   check_dcd_of(@data_dir, @posix_dir, @win32_file)
  #   check_dcd_of_rel(@data_dir, @posix_dir, @win32_dir)
  #   check_dcd_of_rel(@data_dir, @posix_file, @win32_dir)
  #   check_dcd_of_rel(@data_dir, @posix_dir, @win32_file)
  # end

  # test "dcd:  Differences occur earlier (2)" do
  #   check_dcd_of(@test_dir, @test_file, @lib_file)
  #   check_dcd_of(@test_dir, @posix_dir, @lib_file)
  # end

  @tag :no_symlinks
  test "maxsymlinks output (no symlinks)" do
    assert 0 == PU.maxsymlinks()
  end

  @tag :has_symlinks
  test "maxsymlinks output (has symlinks)" do
    expected = case OSUtils.os_id do
      :win32 -> 31
      _      -> 64
    end

    assert expected == PU.maxsymlinks()
  end


  # Helpers


  # defp check_dcd_of(exp_dir, p1, p2) do
  #   assert dc(exp_dir) == dc(PU.dcd(p1, p2))
  #   assert dc(exp_dir) == dc(PU.dcd(p2, p1))
  # end


  # defp check_dcd_of_rel(exp_dir, p1, p2) do
  #   r1 = Path.relative_to_cwd(p1)
  #   r2 = Path.relative_to_cwd(p2)

  #   # Check inputs
  #   assert r1 != p1
  #   assert r2 != p2
  #   if p1 == p2 do
  #     assert r1 == r2
  #   else
  #     assert r1 != r2
  #   end

  #   assert dc(exp_dir) == dc(PU.dcd(r1, p2))
  #   assert dc(exp_dir) == dc(PU.dcd(p2, r1))
  #   assert dc(exp_dir) == dc(PU.dcd(p1, r2))
  #   assert dc(exp_dir) == dc(PU.dcd(r2, p1))
  #   assert dc(exp_dir) == dc(PU.dcd(r1, r2))
  #   assert dc(exp_dir) == dc(PU.dcd(r2, r1))
  # end

  defp dc(s) do
    case OSUtils.os_id do
      :win32 -> String.downcase(s)
      _      -> s
    end
  end

end

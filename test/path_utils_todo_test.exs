Code.require_file "test_helper.exs", __DIR__

defmodule PathUtilsTodoTest do
  use PathUtils.Case


  @moduletag :todo


  test "flunk should not happen!", do: flunk "TODO!!!"


  # test "PU placeholder" do
  #   assert 64 == PU.maxsymlinks()
  # end


end

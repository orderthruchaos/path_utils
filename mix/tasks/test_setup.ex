defmodule Mix.Tasks.TestSetup do
  use Mix.Task

  @shortdoc "Do some setup for tests."

  def run(args) do
    if Enum.any?(args, &(&1 == "--skip-setup")) do
      :foo
    else
      :bar
    end
    report args
  end

  # Helpers

  defp report(args) do
    Mix.shell.info("args: #{inspect args}")
    Mix.shell.info(Mix.Project.build_path)
  end

end

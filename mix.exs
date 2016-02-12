# IO.inspect
Code.load_file("mix/tasks/test_setup.ex", __DIR__)


defmodule PathUtils.Mixfile do
  use Mix.Project

  @version "0.0.1"
  @github  "https://github.com/orderthruchaos/path_utils"

  def project do
    [
      app: :path_utils,
      version: @version,
      elixir: ">= 0.15.0",
      deps: deps,
      description: "Path utilities for Elixir.",
      package: [
        contributors: ["Brett DiFrischia"],
        licenses: ["Apache 2.0"],
        links: %{ "Github" => @github },
      ],
      docs: [
        readme: true,
        main: "README",
        source_url: @github,
        source_ref: @version,
      ],
      aliases: aliases,
    ]
  end

  def application do
    [applications: [:logger, :os_utils]]
  end

  defp deps do
    [
      {:os_utils, "~> 0.3"},
      {:ex_doc, "~> 0.11", only: :dev},
    ]
  end

  defp aliases do
    [
      distclean: [
        "clean",
        "deps.clean --all",
        &clean_extraneous_directories/1,
      ],
      test_setup: &Mix.Tasks.TestSetup.run/1,
    ]
  end

  defp clean_extraneous_directories(_) do
    ~w{_build deps}
    |> Enum.filter(&(File.dir? &1))
    |> Enum.map(&(File.rm_rf! &1))
    # |> Enum.map(&("File.rm_rf! #{&1}"))
    # |> Enum.join("\n")
    # |> Mix.shell.info
  end
end

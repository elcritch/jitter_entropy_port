defmodule JitterEntropyPort.MixProject do
  use Mix.Project

  def project do
    [
      app: :jitter_entropy_port,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      compilers: [:elixir_make] ++ Mix.compilers(),
      name: "JitterEntropyPort",
      source_url: "https://github.com/elcritch/jitter_entropy_port"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {JitterEntropyPort, []},
      applications: [:logger]
    ]
  end

  defp description() do
    "Runs the jitterentropy-rngd using Mountrop to provide extra random noise from CPU jitter"
  end

  defp package do
    [
      # ...
      files: [
        # These are the default files
        "lib",
        "LICENSE",
        "mix.exs",
        "README.md",
        "update.sh",
        "src/*.[ch]",
        "Makefile"
      ]
      # ...
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:muontrap, "~> 0.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

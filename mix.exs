defmodule JitterEntropyPort.MixProject do
  use Mix.Project

  def project do
    [
      app: :jitter_entropy_port,
      version: "0.1.2",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      compilers: [:elixir_make] ++ Mix.compilers()
    ]
  end

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
      name: "jitter_entropy_port",
      files: [
        "lib",
        "LICENSE",
        "mix.exs",
        "README.md",
        "update.sh",
        "priv/.gitkeep",
        "Makefile",
	"src/README.md",
	"src/jitterentropy-base-user.h",
	"src/COPYING",
	"src/jitterentropy-rngd.c",
	"src/jitterentropy-base.c",
	"src/jitterentropy-rngd.1",
	"src/jitterentropy.service.in",
	"src/jitterentropy.h",
	"src/Makefile",
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/elcritch/jitter_entropy_port"}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:elixir_make, "~> 0.4", runtime: false},
      {:muontrap, "~> 0.4"}
    ]
  end
end

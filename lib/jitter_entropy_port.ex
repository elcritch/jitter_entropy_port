defmodule JitterEntropyPort do
  use Application
  require Logger

  def start(_type, _args) do
    priv_dir = :code.priv_dir(:jitter_entropy_port) |> to_string()
    jitter_bin = Path.join(priv_dir, "priv/jitterentropy-rngd")
    jitter_options = []

    Logger.info("Starting Jitter Entropy Service ")

    children = [
      {MuonTrap.Daemon, [jitter_bin, ["-v"], jitter_options]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

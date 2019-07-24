defmodule JitterEntropyPort do
  use Application

  def start(_type, _args) do
    priv_dir = :code.priv_dir(:jitter_entropy_port) |> to_string()
    jitter_bin = Path.join(priv_dir, "priv/jitterentropy-rngd")
    jitter_options = []

    children = [
      {MuonTrap.Daemon, [jitter_bin, [], jitter_options]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

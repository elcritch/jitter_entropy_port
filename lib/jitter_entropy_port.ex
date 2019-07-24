defmodule JitterEntropyPort do
  use Application
  require Logger

  @moduledoc """

  Start as an Application and it will automatically load jitter-entropy daemon.

  If the `jitterentropy` needs loaded as a kernel module set in your config.exs:

      config :jitter_entropy_port, :load_module, true

  """
  def start(_type, _args) do
    priv_dir = :code.priv_dir(:jitter_entropy_port) |> to_string()
    jitter_bin = Path.join(priv_dir, "jitterentropy-rngd")
    jitter_options = []

    Logger.info("Starting Jitter Entropy Service ")

    children = [
      {Task, &load_module/0},
      {MuonTrap.Daemon, [jitter_bin, ["-v"], jitter_options]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def load_module() do
    if Application.get_env(:jitter_entropy_port, :load_module, false) == true do
      System.cmd("modprobe", ["jitterentropy_rng"])
    end
  end
end

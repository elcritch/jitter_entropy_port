# JitterEntropyPort

Elixir wrapper for `jiterentropy-rngd` by @smuellerDD:

    Using the Jitter RNG core, the rngd provides an entropy source that feeds into the Linux /dev/random device if its entropy runs low. It updates the /dev/random entropy estimator such that the newly provided entropy unblocks /dev/random.

    The seeding of /dev/random also ensures that /dev/urandom benefits from entropy. Especially during boot time, when the entropy of Linux is low, the Jitter RNGd provides a source of sufficient entropy.

Useful on embedded devices without a TRNG/PRNG support.

Requires the `jitter` module in the Linux kernel is loaded or compiled in.

More info here: https://www.chronox.de/jent/doc/CPU-Jitter-NPTRNG.html

## Kernel Config

Enable the jitter entropy module using menuconfig, or modify the Linux kernel config by setting:

```
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_JITTERENTROPY=y
```

If the `jitterentropy` needs loaded as a kernel module set in your config.exs:

    config :jitter_entropy_port, :load_module, true

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `jitter_entropy_port` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:jitter_entropy_port, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/jitter_entropy_port](https://hexdocs.pm/jitter_entropy_port).

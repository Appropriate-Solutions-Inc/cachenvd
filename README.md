# Cache NVD

TODO

- Add description

## Commands

```bash
# Run server locally
mix run --no-halt

# Curl example
curl -vvv https://services.nvd.nist.gov/rest/json/cves/2.0\?cveId\=CVE-2023-4030
curl -vvv http://localhost:4000/rest/json/cves/2.0\?cveId\=CVE-2023-4030
```

## Scripts

```bash
mix amnesia.create -d CacheNvdDatabase --disk
mix amnesia.drop -d CacheNvdDatabase
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cachenvd` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cachenvd, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/cachenvd>.

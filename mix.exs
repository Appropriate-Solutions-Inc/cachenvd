defmodule Cachenvd.MixProject do
  use Mix.Project

  @version "0.0.2"

  def project do
    [
      app: :cachenvd,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Cachenvd.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, ">=0.7.7"},
      {:nimble_csv, "~> 1.2"},
      {:amnesia, "~> 0.2.8"},
      {:req, "~> 0.4.0"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:stream_data, "~> 0.6", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev], runtime: false},
      {:inch_ex, "~>  2.1.0-rc.1", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.17.1", only: [:test], runtime: false},
      {:sobelow, "~> 0.13", only: [:dev, :test], runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

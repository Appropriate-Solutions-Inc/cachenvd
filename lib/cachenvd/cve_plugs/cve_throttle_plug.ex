defmodule Cachenvd.CveThrottlePlug do
  @moduledoc """
  Throttle API lookups based on existing of key.

  An extremely crude throttling system.
  In production, an API lookup is extremely rare as CVEs should be in the cache.

  # TODO: Logging on problem waits.
  # TODO: Metrics

  """

  # 7 seconds
  @no_api_key_wait_msecs 7 * 1000

  # 0.7 seconds
  @api_key_wait_msecs 7 * 100

  # 5 minutes
  @problem_wait_msecs 5 * 1000 * 60

  def init(opts) do
    opts
  end

  def _api_key_wait(conn) do
    case Application.get_env(:cachenvd, :nvd_api_key) do
      nil ->
        IO.puts("Sleeping without API key.")
        Process.sleep(@no_api_key_wait_msecs)

      _ ->
        IO.puts("Sleeping with API key.")
        Process.sleep(@api_key_wait_msecs)
    end

    IO.puts("Sleep over.")

    conn
  end

  def call(conn, _opts) do
    conn
    |> _api_key_wait()
  end
end

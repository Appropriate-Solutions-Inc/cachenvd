defmodule Cachenvd.NvdApiKeyPlug do
  @moduledoc """
  Set the NVD API key from the URL or environment, if available.

  Set :has_api_key in conn.assigns to true or false.

  Query params have already been fetched.
  """
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    # conn = Plug.Conn.fetch_query_params(conn)
    # params = conn.query_params

    conn
    |> assign(:nvd_api_key, "TBD")
    |> assign(:nvd_api_sleep_seconds, 0.07)
    |> assign(:has_nvd_api_key, true)
  end
end

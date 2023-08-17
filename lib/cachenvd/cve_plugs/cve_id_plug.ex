defmodule Cachenvd.CveIdPlug do
  @moduledoc """
  Ensure request includes a cveId parameter.

  Extract the query params and check for cveId=xxx.
  Do nothing if cveID is present.
  If cveID is not present, return 400 status code and error and halt the plugs.

  """
  import Plug.Conn

  if Mix.env() == :dev do
    use Plug.Debugger
  end

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.query_params

    case params do
      %{"cveId" => value} ->
        IO.puts("Has cveID query parameter: #{value}")

      _ ->
        put_resp_content_type(conn, "text/html")
        send_resp(conn, 400, "Request is missing the cveId parameter.")
    end

    conn
  end
end

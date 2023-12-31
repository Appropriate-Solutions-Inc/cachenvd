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
        conn
        |> assign(:cve_id, value)

      _ ->
        conn
        |> put_resp_content_type("text/html")
        |> send_resp(400, "Request is missing the cveId parameter.")
        |> halt
    end
  end
end

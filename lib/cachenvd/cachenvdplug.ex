defmodule Cachenvd.Router do
  @moduledoc """
  Route National Vulnerability Database (NVD) lookups.

  Supports
  - CVE: Vulnerabilities
  """
  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger
  end

  use Plug.ErrorHandler

  plug(:match)
  plug(:dispatch)

  get "/rest/json/cves/2.0" do
    nvd_api_key = Application.get_env(:cachenvd, :keys)[:nvd_api_key]
    IO.puts(nvd_api_key)
    _query_params = fetch_query_params(conn).params

    put_resp_content_type(conn, "application/json")
    send_resp(conn, 200, '["hello", "world"]')
  end

  match _ do
    send_resp(conn, 404, "Resource not found.")
  end

  @impl Plug.ErrorHandler
  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Unknown error")
  end
end

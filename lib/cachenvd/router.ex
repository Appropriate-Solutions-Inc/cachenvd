defmodule Cachenvd.Router do
  @moduledoc """
  Route National Vulnerability Database (NVD) lookups.

  Supports
  - CVE: Vulnerabilities

  All else is status 404
  """

  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger
  end

  use Plug.ErrorHandler

  plug(:match)
  plug(:dispatch)

  get "/rest/json/cves/2.0" do
    put_resp_content_type(conn, "text/json")
    send_resp(conn, 200, "['hello']")
  end

  match _ do
    send_resp(conn, 404, "Resource not found.")
  end

  @impl Plug.ErrorHandler
  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Unknown error")
  end
end

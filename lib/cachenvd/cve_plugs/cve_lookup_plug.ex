defmodule Cachenvd.CveLookupPlug do
  @moduledoc """
  Lookup the CVE ID from the NIST NVD web API.
  """

  import Plug.Conn

  @receive_timeout_ms 60 * 1000
  @connect_timeout_ms 15 * 1000

  if Mix.env() == :dev do
    use Plug.Debugger
  end

  def init(opts) do
    opts
  end

  def _trace_conn(conn, msg) do
    IO.puts(msg)
    conn
  end

  def call(conn, _opts) do
    IO.puts("NVD API lookup plug")
    cve_id = conn.assigns[:cve_id]
    url = "https://services.nvd.nist.gov/rest/json/cves/2.0\?cveId=#{cve_id}"

    headers =
      if conn.assigns[:has_nvd_api_key] do
        [
          ~c"apiKey",
          conn.assigns[:nvd_api_key]
        ]
      else
        []
      end

    resp =
      Req.get!(url,
        headers: headers,
        receive_timeout: @receive_timeout_ms,
        connect_options: [timeout: @connect_timeout_ms]
      )

    conn
    |> _trace_conn("Calling process_resp")
    |> process_resp(resp)
    |> _trace_conn("Returned from process_resp")
  end

  def process_resp(conn, resp) do
    case resp.status do
      200 ->
        conn
        |> put_resp_content_type("json/application")
        |> send_resp(200, "JSON to be implemented")

      _ ->
        conn
        |> put_resp_content_type("text/html; charset=utf-8")
        |> resp(resp.status, "#{resp.status}")
    end
  end
end

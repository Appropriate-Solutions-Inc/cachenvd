defmodule Cachenvd.CveLookupPlug do
  @moduledoc """
  Lookup the CVE ID from the NIST NVD web API.
  """

  import Plug.Conn

  if Mix.env() == :dev do
    use Plug.Debugger
  end

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
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

    resp = Req.get!(url <> cve_id, headers: headers)

    conn
    |> put_resp_content_type("json/application")
    |> send_resp(200, ~c"To Be Implemented")
  end
end

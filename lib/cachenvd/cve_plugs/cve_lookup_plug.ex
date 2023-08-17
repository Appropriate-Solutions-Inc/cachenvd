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
    put_resp_content_type(conn, "json/application")
    send_resp(conn, 200, 'To Be Implemented')
    conn
  end
end

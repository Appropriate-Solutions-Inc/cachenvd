defmodule Cachenvd.CveCachedPlug do
  @moduledoc """
  Attempt cache lookup of cve_id.

  The connection query parameters are known to have been loaded and
  the cveId query parameter exists.
  """

  import Plug.Conn
  alias Cachenvd.DB

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    cve = DB.get_cve(conn.assigns[:cve_id])

    case cve do
      {:unknown, _} ->
        IO.puts("Not cached, needs to be looked up.")

      {:ok, jsn} ->
        put_resp_content_type(conn, "application/json")
        send_resp(conn, 200, jsn)
    end

    conn
  end
end

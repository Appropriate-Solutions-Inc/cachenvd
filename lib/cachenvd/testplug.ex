defmodule HelloPlug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn
    |> nvd_api()
  end

  defp nvd_api(conn) when conn.path_info == ["rest", "json", "cves", "2.0"] do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World")
  end

  defp nvd_api(conn) when conn.path_info == ["favicon.ico"] do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(404, "")
  end

  defp nvd_api(conn) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(404, "Not found")
  end
end

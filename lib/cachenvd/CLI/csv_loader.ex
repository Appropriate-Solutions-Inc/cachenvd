defmodule Cachenvd.CLI.CsvLoader do
  @moduledoc """
  Load nvd-data.csv file.

  .. todo::
    Adjust mnesia configuration to avoid overload warning.
    https://streamhacker.com/2008/12/10/how-to-eliminate-mnesia-overload-events/

  """

  # Source: https://jacobswanner.com/development/2022/nimble-csv-maps/

  require Amnesia
  require Amnesia.Helper

  require CacheNvdDatabase
  alias CacheNvdDatabase.CacheNvdCve

  alias NimbleCSV.RFC4180, as: CSV

  @doc """
  Load NVD CVE data from a .csv file.

  File must be in RFC4180 format (commas and double double-quote as escape.)
  Includes a header row: (cve_id, cve)

  Defaults to <cwd>/nvd-data.csv

  iex(3)> Cachenvd.CLI.CsvLoader.load()
  """
  def load(filename \\ "./nvd-data.csv") do
    filename
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Stream.transform(nil, fn row, acc -> {_loader(row), acc} end)
    |> Stream.run()
  end

  defp _loader([cve_id, cve]) do
    Amnesia.transaction do
      %CacheNvdCve{cve_id: cve_id, cve: cve}
      |> CacheNvdCve.write()
    end

    [cve_id, cve]
  end
end

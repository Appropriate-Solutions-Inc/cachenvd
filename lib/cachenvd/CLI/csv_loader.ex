defmodule Cachenvd.CLI.CsvLoader do
  @moduledoc """
  Load nvd-data.csv file.
  """

  # Source: https://jacobswanner.com/development/2022/nimble-csv-maps/

  alias NimbleCSV.RFC4180, as: CSV

  @doc """
  Load NVD CVE data from a .csv file.

  File must be in RFC4180 format (commas and double double-quote as escape.)
  Includes a header row: (cve_id, cve)

  Defaults to cwd/nvd-data.csv
  """
  def load(filename \\ "./nvd-data.csv") do
    filename
    |> File.stream!()
    |> CSV.parse_stream(skip_headers: false)
    |> Stream.transform(nil, fn
      headers, nil -> {[], headers}
      row, headers -> {[Enum.zip(headers, row) |> Map.new()], headers}
    end)
    |> Enum.to_list()

    # |> IO.inspect()
  end
end

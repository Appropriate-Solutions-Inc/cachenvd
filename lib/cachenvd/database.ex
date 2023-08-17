defmodule(Cachenvd.DB) do
  @moduledoc """
  Database handling routines.
  """
  require Amnesia
  require Amnesia.Helper

  alias CacheNvdDatabase.CacheNvdCve

  def get_cve(cve_id) do
    Amnesia.transaction do
      case CacheNvdCve.read(cve_id) do
        nil ->
          {:unknown, nil}

        cve ->
          {:ok, cve.cve}
      end
    end
  end
end

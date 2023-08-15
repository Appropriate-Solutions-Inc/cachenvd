defmodule(Cachenvd.DB) do
  @moduledoc """
  Database handling routines.
  """
  require Amnesia
  require Amnesia.Helper

  alias CacheNvdDatabase.CacheNvdCve

  def get_cve(cve_id) do
    Amnesia.transaction do
      CacheNvdCve.read(cve_id)
    end
  end
end

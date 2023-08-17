defmodule Cachenvd.CvePlug do
  @moduledoc """
  Top of the CVE lookup route.
  """

  use Plug.Builder

  plug(Cachenvd.CveIdPlug)
  plug(Cachenvd.NvdApiKeyPlug)
  plug(Cachenvd.CveCachedPlug)
  plug(Cachenvd.CveLookupPlug)
end

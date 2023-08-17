defmodule Cachenvd.CvePlug do
  @moduledoc """
  Top of the CVE lookup route.
  """

  use Plug.Builder

  plug(Cachenvd.CveIdPlug)
  plug(Cachenvd.CveCachedPlug)
end

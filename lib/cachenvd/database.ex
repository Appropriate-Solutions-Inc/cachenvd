# mix amnesia.create -d CacheNvdDatabase --disk

# Examples
# https://github.com/meh/amnesia
# https://code.tutsplus.com/store-everything-with-elixir-and-mnesia--cms-29821a

use Amnesia

defdatabase CacheNvdDatabase do
  # Define CacheNVD database.

  deftable Cve, [:cve_id, :cve] do
    @type t :: %Cve{cve_id: String.t(), cve: String.t()}
    # Not using helper functions as this is a single flat table.
  end
end

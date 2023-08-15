# mix amnesia.create -d CacheNvdDatabase --disk

# Examples
# https://github.com/meh/amnesia
# https://code.tutsplus.com/store-everything-with-elixir-and-mnesia--cms-29821a
# https://github.com/jschoch/elixir_cowboy_amnesia_eex/blob/master/lib/db.ex

use Amnesia

defdatabase CacheNvdDatabase do
  # Define CacheNVD database.

  deftable CacheNvdCve, [:cve_id, :cve], type: :ordered_set do
    @type t :: %CacheNvdCve{cve_id: String.t(), cve: String.t()}
    # No helper functions as this is a single flat table.
  end
end

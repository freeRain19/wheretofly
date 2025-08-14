# frozen_string_literal: true

module Fetchers
  # Fetches destination data for a specific airport from Ryanair API
  class Destination < BaseFetcher
    def self.call(code, lang = 'en')
      get("https://www.ryanair.com/api/views/locate/searchWidget/routes/#{lang}/airport/#{code}")
    end
  end
end

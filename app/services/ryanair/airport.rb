# frozen_string_literal: true

module Ryanair
  # Fetches airport data from Ryanair API
  class Airport < BaseFetcher
    def self.call(lang)
      get("https://www.ryanair.com/api/views/locate/5/airports/#{lang}/active")
    end
  end
end

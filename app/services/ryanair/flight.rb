# frozen_string_literal: true

module Ryanair
  # Fetches flights dates from Ryanair API for a specific route
  class Flight < Base
    def self.call(from, to)
      get("https://www.ryanair.com/api/farfnd/3/oneWayFares/#{from}/#{to}/availabilities")
    end
  end
end

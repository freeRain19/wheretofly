# frozen_string_literal: true

module Ryanair
  # Fetches schedule data for a specific airport from Ryanair API
  class Schedule < BaseFetcher
    def self.call(city_code)
      get("https://www.ryanair.com/api/timtbl/3/schedules/#{city_code}/periods")
    end
  end
end

# frozen_string_literal: true

module Fetchers
  # Fetches schedule data for a specific airport from Ryanair API
  class Schedule < BaseFetcher
    def self.call(code)
      get("https://www.ryanair.com/api/timtbl/3/schedules/#{code}/periods")
    end
  end
end

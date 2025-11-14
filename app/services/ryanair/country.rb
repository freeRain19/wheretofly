# frozen_string_literal: true

module Ryanair
  # Service to fetch country data from Ryanair API
  class Country < Base
    def self.call(lang = 'en')
      get("https://www.ryanair.com/api/views/locate/3/countries/#{lang}")
    end
  end
end

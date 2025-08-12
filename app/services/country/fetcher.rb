# frozen_string_literal: true

module Country
  # Service to fetch country data from Ryanair API
  class Fetcher
    URL = 'https://www.ryanair.com/api/views/locate/3/countries/en'
    def call
      FastJsonparser.parse(Typhoeus.get(URL, followlocation: true).response_body).map do |country|
        Dto::Country.new(**country).to_h
      end
      # FastJsonparser.parse(Typhoeus.get(URL, followlocation: true).response_body)
    end
  end
end

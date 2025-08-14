# frozen_string_literal: true

module Fetchers
  # Base class for all fetchers
  class BaseFetcher
    def initialize
      raise NotImplementedError, "#{self.class} is an singleton class and cannot be instantiated."
    end

    def self.get(url)
      FastJsonParser.parse(
        ApiService.get(
          url,
          followlocation: true
        )
      )
    end
  end
end

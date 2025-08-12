# frozen_string_literal: true

module Dto
  Country = Data.define(
    :name,
    :currency,
    :code,
    :iso3code,
    :defaultAirportCode,
    :schengen
  )
end

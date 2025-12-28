# frozen_string_literal: true

module ApiSchemas

  def airport_structure
    {
      code: a_kind_of(String),
      name: a_kind_of(String),
      seoName: a_kind_of(String),
      aliases: a_kind_of(Array),
      base: a_kind_of(TrueClass).or(a_kind_of(FalseClass)),
      # macCode: match(city_structure).or(be_nil),
      city: city_structure,
      region: region_structure,
      country: country_structure,
      coordinates: coordinates_structure,
      timeZone: a_kind_of(String)
    }
  end


  def country_structure
      {
        code: a_kind_of(String),
        iso3code: a_kind_of(String),
        name: a_kind_of(String),
        currency: a_kind_of(String),
        defaultAirportCode: a_kind_of(String).or(be_nil),
        schengen: a_kind_of(TrueClass).or(a_kind_of(FalseClass))
      }
  end

  def region_structure
      {
        name: a_kind_of(String),
        code: a_kind_of(String)
      }
  end

  def coordinates_structure
      {
        latitude: a_kind_of(Float),
        longitude: a_kind_of(Float)
      }
  end
end
# frozen_string_literal: true

# Adapter for Fast JSON API to handle JSON parsing
class FastJsonParser
  def self.parse(json)
    Oj.load(json)
  rescue JSON::ParserError => e
    Rage.logger.error("JSON parsing error: #{e.message}")
    raise e
  end

  def self.to_json(object)
    Oj.dump(object)
  rescue JSON::GeneratorError => e
    Rage.logger.error("JSON generation error: #{e.message}")
    raise e
  end
end

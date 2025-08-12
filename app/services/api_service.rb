# frozen_string_literal: true

# created as adapter for Typhoeus to handle API requests
class ApiService
  def self.get(url, options = {})
    response = Typhoeus.get(url, options)
    raise "API request failed with status: #{response.code}, body: #{response.body}" unless response.success?

    response.body
  rescue StandardError => e
    Rage.logger.error("API request error: #{e.message}")
    raise e
  end

  def self.post(url, body, options = {})
    response = Typhoeus.post(url, body: body, **options)
    raise "API request failed with status: #{response.code}, body: #{response.body}" unless response.success?

    response.body
  rescue StandardError => e
    Rage.logger.error("API request error: #{e.message}")
    raise e
  end
end

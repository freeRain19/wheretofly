# frozen_string_literal: true

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr/cassettes'

  config.hook_into :webmock

  config.default_cassette_options = {
    record: :once,
    match_requests_on: [:method, :uri]
  }
end
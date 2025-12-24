# frozen_string_literal: true
source "https://rubygems.org"

gem "rage-rb", "~> 1.18"

# Build JSON APIs with ease
# gem "alba"

# Get 50% to 150% boost when parsing JSON.
# Rage will automatically use FastJsonparser if it is available.
# gem "fast_jsonparser"
gem 'typhoeus', '~> 1.4', '>= 1.4.1'
gem 'oj', '~> 3.16', '>= 3.16.11'

group :development, :test do
  gem 'pry-byebug', '~> 3.11'
  gem 'bundler-audit', '~> 0.9.2'
end

group :test do
  gem 'vcr', '~> 6.3', '>= 6.3.1'
  gem 'webmock', '~> 3.26', '>= 3.26.1'
  gem 'rspec', '~> 3.13', '>= 3.13.1'
end

group :development do
  gem 'rubocop', '~> 1.78'
  gem 'rubocop-performance', '~> 1.25'
  gem 'rubocop-rspec', require: false
end

# frozen_string_literal: true

# Controller to handle requests for country data
class CountriesController < ApplicationController
  # @response Array<Dto::Country>
  def index
    @countries = Fetchers::Country.call

    render json: @countries, status: :ok
  end
end

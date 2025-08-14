# frozen_string_literal: true

# Controller to provide airport data
class AirportsController < ApplicationController
  # @response Array<Json>
  def index
    @airports = Fetchers::Airport.call

    render json: @airports, status: :ok
  end
end

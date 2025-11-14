# frozen_string_literal: true

# Controller to provide airport data
class AirportsController < ApplicationController
  # @response Array<Json>
  def index
    @airports = Ryanair::Airport.call

    render json: @airports, status: :ok
  end
end

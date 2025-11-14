# frozen_string_literal: true

# Provide flights dates for a given route
class FlightsController < ApplicationController
  # @route GET /flights
  # @param to <String>
  # @param from <String>
  # @response Array<Json>
  # @response 200 OK
  # @response 400 Bad Request
  # @response 500 Internal Server Error
  def index
    @flights = Ryanair::Flight.call(params.fetch(:from).upcase, params.fetch(:to).upcase)

    render json: @flights, status: :ok
  end
end

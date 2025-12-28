# frozen_string_literal: true

# Controller to provide airport data
class AirportsController < ApplicationController
  # @response Array<Json>
  def index
    @airports = Ryanair::Airport.call(params.fetch(:code, 'en'))

    render json: @airports, status: :ok
  rescue StandardError => e
    render json: { errors: e.message }, status: :bad_request
  end
end

# frozen_string_literal: true

# Provide destinations from the airport API
class DestinationsController < ApplicationController
  # @param <String> code
  # @response Array<Dto::Country>
  def index
    # binding.pry
    @destinations = Fetchers::Destination.call(params.fetch(:code).upcase)

    render json: @destinations, status: :ok
  end
end

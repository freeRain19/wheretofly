# frozen_string_literal: true

# Provide schedules for selected airport
class SchedulesController < ApplicationController
  # @param code <String>
  # @response Array<Json>
  def index
    verify_params!
    @schedules = Ryanair::Schedule.call(params.fetch(:code).upcase)

    render json: @schedules, status: :ok
  rescue ParameterMissingError => e
    render json: { errors: e.message }, status: :bad_request
  end

  private

  def verify_params!
    return if params.fetch(:code, false)

    raise ParameterMissingError :code
  end
end

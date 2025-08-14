# frozen_string_literal: true

# Provide schedules for selected airport
class SchedulesController < ApplicationController
  # @param code <String>
  # @response Array<Json>
  def index
    @schedules = Fetchers::Schedule.call(params.fetch(:code).upcase)

    render json: @schedules, status: :ok
  end
end

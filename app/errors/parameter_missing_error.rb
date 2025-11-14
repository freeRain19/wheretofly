# frozen_string_literal: true

# Error raised when required arguments didn't come.
class ParameterMissingError < StandardError
  def initialize(fields:, msg: nil)
    msg ||= fields.map do |field_name|
      "Parameter #{field_name} is required"
    end.join(', ')

    super(msg)
  end
end

# frozen_string_literal: true

# Error raised when required arguments didn't come.
class ParameterMissingError < StandardError
  def initialize(param_name, msg = nil)
    @param_name = param_name
    super(msg || "Parameter #{param_name} is required")
  end
end

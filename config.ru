require_relative "config/application"

run Rage.application

map "/publicapi" do
  run Rage.openapi.application
end
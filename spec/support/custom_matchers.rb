RSpec::Matchers.define :be_boolean do
  match do |actual|
    [false, true].include? actual
  end
end
# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Ryanair::Country do
  subject(:countries) { described_class.call }

  describe '#call', vcr: 'countries' do
    let(:expected_structure) do
      {
        code: a_kind_of(String),
        iso3code: a_kind_of(String),
        name: a_kind_of(String),
        currency: a_kind_of(String),
        defaultAirportCode: a_kind_of(String),
        schengen: a_kind_of(TrueClass).or(a_kind_of(FalseClass))
      }
    end

    it 'returns an array of data', :aggregate_failures do
      expect(countries).to be_an_instance_of(Array)
      expect(countries).not_to be_empty
    end


    it 'return correct structure' do
      expect(countries).to all(match(expected_structure))
    end
  end
end
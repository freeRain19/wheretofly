# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Ryanair::Airport do
  include ApiSchemas

  subject(:airports) { described_class.call(lang) }

  let(:lang) { 'en' }

  describe '#call' do
    context 'when default language', vcr: 'airports' do
      it 'returns an array of data', :aggregate_failures do
        expect(airports).to be_an_instance_of(Array)
        expect(airports).not_to be_empty
      end

      it 'return correct structure', :aggregate_failures do
        any_airport = airports.sample
        expect(any_airport[:code]).to be_an_instance_of(String)
        expect(any_airport[:name]).to be_an_instance_of(String)
        expect(any_airport[:seoName]).to be_an_instance_of(String)
        expect(any_airport[:aliases]).to be_an_instance_of(Array)
        expect(any_airport[:base]).to be_boolean
        expect(any_airport[:city]).to be_an_instance_of(Hash)
        expect(any_airport[:region]).to match(region_structure)
        expect(any_airport[:country]).to match(country_structure)
        expect(any_airport[:coordinates]).to match(coordinates_structure)
        expect(any_airport[:timeZone]).to be_an_instance_of(String)
      end
    end

    context 'when Spanish language', vcr: 'airports_es' do
      let(:lang) { 'es' }

      it 'returns an array of data', :aggregate_failures do
        expect(airports).to be_an_instance_of(Array)
        expect(airports).not_to be_empty
      end

      it 'return correct structure', :aggregate_failures do
        any_airport = airports.sample
        expect(any_airport[:code]).to be_an_instance_of(String)
        expect(any_airport[:name]).to be_an_instance_of(String)
        expect(any_airport[:seoName]).to be_an_instance_of(String)
        expect(any_airport[:aliases]).to be_an_instance_of(Array)
        expect(any_airport[:base]).to be_boolean
        expect(any_airport[:city]).to be_an_instance_of(Hash)
        expect(any_airport[:region]).to match(region_structure)
        expect(any_airport[:country]).to match(country_structure)
        expect(any_airport[:coordinates]).to match(coordinates_structure)
        expect(any_airport[:timeZone]).to be_an_instance_of(String)
      end
    end
  end
end
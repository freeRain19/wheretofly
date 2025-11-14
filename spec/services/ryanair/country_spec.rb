# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Ryanair::Country do
  subject(:countries) { described_class.call }
  let(:api_response) {
    [{
       name: 'Ireland',
       code: 'IE',
       currency: 'EUR',
       iso3code: 'IRL',
       defaultAirportCode: 'DUB',
       schengen: false
     }].to_json
  }

  describe '#call' do
    before do
      allow(ApiService).to receive(:get).and_return(api_response)
    end

    it 'returns an array of countries', :aggregate_failures do
      expect(countries).to be_an_instance_of(Array)
      expect(countries.size).to eq(1)
      expect(countries.first).to be_an_instance_of(Hash)
      expect(countries.first[:name]).to eq('Ireland')
      expect(countries.first[:code]).to eq('IE')
      expect(countries.first[:currency]).to eq('EUR')
      expect(countries.first[:iso3code]).to eq('IRL')
      expect(countries.first[:defaultAirportCode]).to eq('DUB')
      expect(countries.first[:schengen]).to be(false)
    end
  end
end
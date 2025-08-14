# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Fetcher::Country do
  let(:fetcher) { described_class.new }

  describe '#call' do

    before do
      allow(ApiService).to receive(:get).and_return([{
        name: 'Ireland',
        code: 'IE',
        currency: 'EUR',
        iso3code: 'IRL',
        defaultAirportCode: 'DUB',
        schengen: false
      }].to_json)
    end

    it 'returns an array of countries', :aggregate_failures do
      result = fetcher.call
      expect(result).to be_an_instance_of(Array)
      expect(result.first).to be_an_instance_of(Hash)
      expect(result.first[:name]).to eq('Ireland')
      expect(result.first[:code]).to eq('IE')
      expect(result.first[:currency]).to eq('EUR')
      expect(result.first[:iso3code]).to eq('IRL')
      expect(result.first[:defaultAirportCode]).to eq('DUB')
      expect(result.first[:schengen]).to be(false)
    end
  end
end
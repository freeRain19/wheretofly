# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Ryanair::Schedule do
  subject(:result) { described_class.call(city_code) }

  describe '#call' do
    context 'when city is BER', vcr: "cities#BER" do
      let(:city_code) { 'BER' }

      it 'returns valid data', :aggregate_failures do
        expect(result).to be_an_instance_of(Hash)
        expect(result.fetch(:MXP)).to have_key(:firstFlightDate)
        expect(result.fetch(:MXP)).to have_key(:lastFlightDate)
        expect(result.fetch(:MXP)).to have_key(:monthsFromToday)
        expect(result.fetch(:MXP)).to have_key(:months)
      end

      it 'first flight date has correct format' do
        flight_date = result.dig(:MXP, :firstFlightDate)
        expect(flight_date).to be_a(String)
        expect { Time.strptime(flight_date, "%Y-%m-%d") }.not_to raise_error
      end

      it 'last flight date has correct format' do
        flight_date = result.dig(:MXP, :lastFlightDate)
        expect(flight_date).to be_a(String)
        expect { Time.strptime(flight_date, "%Y-%m-%d") }.not_to raise_error
      end

      it 'months from today is an Integer' do
        flight_date = result.dig(:MXP, :monthsFromToday)
        expect(flight_date).to be_a(Integer)
      end

      it 'months is an Integer' do
        flight_date = result.dig(:MXP, :months)
        expect(flight_date).to be_a(Integer)
      end
    end

    context 'when city is BCN' do
      let(:city_code) { 'BCN' }

      it 'returns a successful response', vcr: "cities#BCN" do
        expect(result).to be_an(Hash)
        expect(result).not_to be_empty
      end
    end
  end
end
# frozen_string_literal: true
require 'spec_helper'

RSpec.describe CountriesController, type: :request do
  describe "#index" do
    let(:stub_result) { [{
      name: 'Ireland',
      code: 'IE',
      currency: 'EUR',
      iso3code: 'IRL',
      defaultAirportCode: 'DUB',
      schengen: false
    }] }

    context 'when data is available' do
      before do
        allow(Ryanair::Country).to receive(:call).and_return(stub_result)
        get '/countries'
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an array of countries' do
        expect(JSON.parse(response.body)).to be_an_instance_of(Array)
        expect(JSON.parse(response.body).first['code']).to eq('IE')
        expect(JSON.parse(response.body).first['name']).to eq('Ireland')
      end
    end
  end
end

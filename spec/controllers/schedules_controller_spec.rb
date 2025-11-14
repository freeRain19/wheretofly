# frozen_string_literal: true
require 'spec_helper'

RSpec.describe SchedulesController, type: :request do
  describe "#index" do
    let(:params) { { code: 'BER' } }
    let(:stub_result) { [{
      name: 'Ireland',
      code: 'IE',
      currency: 'EUR',
      iso3code: 'IRL',
      defaultAirportCode: 'DUB',
      schengen: false
    }] }

    before do
      allow(Ryanair::Schedule).to receive(:call).and_return(stub_result)
      get '/schedules', params: params
    end

    context 'when code is provided' do
      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an array of countries' do
        expect(json_response).to be_an_instance_of(Array)
        expect(json_response.first[:code]).to eq('IE')
        expect(json_response.first[:name]).to eq('Ireland')
      end
    end

    context 'without params' do
      let(:params) { {} }

      it 'returns a successful response' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns an error message' do
        expect(json_response).to include(errors: 'Parameter code is required')
      end
    end
  end
end

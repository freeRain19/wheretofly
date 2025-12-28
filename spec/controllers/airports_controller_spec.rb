# frozen_string_literal: true

require 'spec_helper'

RSpec.describe  AirportsController, type: :request do
  describe "#index" do
    before do
      get '/airports', params: params
    end

    let(:params) { {} }

    context 'when data is available', vcr: 'airports' do
      it 'returns a successful response', :aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(json_response).to be_an_instance_of(Array)
        expect(json_response).not_to be_empty
      end
    end

    context 'when data in Spanish', vcr: 'airports_es' do
      let(:params) { { code: 'es' } }

      it 'returns a successful response', :aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(json_response).to be_an_instance_of(Array)
        expect(json_response).not_to be_empty
      end
    end

    context 'when country code is incorrect', vcr: 'airports_INCORRECT' do
      let(:params) { { code: 'INCORRECT' } }

      it 'returns a bad request' do
        expect(response).to have_http_status(:bad_request)
        expect(json_response[:errors]).not_to be_empty
      end
    end
  end
end

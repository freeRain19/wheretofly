# frozen_string_literal: true
require 'spec_helper'

RSpec.describe SchedulesController, type: :request do
  describe "#index" do
    before do
      get '/schedules', params: params
    end

    context 'when city is BER', vcr: 'cities#BER' do
      let(:params) { { code: 'BER' } }

      context 'when code is provided' do
        it 'returns a successful response' do
          expect(response).to have_http_status(:ok)
        end

        it 'returns an array of countries' do
          expect(json_response).to be_an_instance_of(Hash)
          expect(json_response).not_to be_empty
        end
      end
    end

    context 'without params' do
      let(:params) { {} }

      it 'returns a bad request' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns an error message' do
        expect(json_response).to include(errors: 'Parameter code is required')
      end
    end

    context 'when incorrect city code', vcr: 'cities#GE' do
      let(:params) { { code: 'GE' } }

      context 'when code is provided' do
        it 'returns a successful response' do
          expect(response).to have_http_status(:bad_request)
        end
      end
    end
  end
end

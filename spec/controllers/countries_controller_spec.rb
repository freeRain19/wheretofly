# frozen_string_literal: true
require 'spec_helper'

RSpec.describe CountriesController, type: :request do
  describe "#index", vcr: 'countries' do
    before do
      get '/countries', params: {}
    end

    context 'when data is available' do
      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an array of countries' do
        expect(json_response).to be_an_instance_of(Array)
        expect(json_response).not_to be_empty
      end
    end
  end
end

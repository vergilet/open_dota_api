# frozen_string_literal: true

require 'spec_helper'

describe OpenDotaApi::Connection do
  describe 'default attributes' do
    let(:pathname) { '/' }

    it 'includes httparty methods' do
      allow(OpenDotaApi::Connection).to receive(:get)
    end

    it 'returns response object' do
      stub_request(:get, 'http://api.opendota.com/')
        .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
        .to_return(status: 200, body: '', headers: {})

      expect(OpenDotaApi::Connection.get(pathname).class).to eq HTTParty::Response
    end

    it 'must have the base url set to Steam endpoint' do
      expect(OpenDotaApi::Connection.base_uri).to eq 'http://api.opendota.com'
    end
  end
end

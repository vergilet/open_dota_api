# frozen_string_literal: true

require 'spec_helper'

describe OpenDotaApi::League do
  let(:league_id) { 1415 }
  let(:ticket) { 'econ/leagues/subscriptions_cebu' }
  let(:banner) { 'econ/leagues/subscriptions_cebu_ingame' }
  let(:tier) { 'amateur' }
  let(:name) { 'Dota 2 Cebu League Season 5' }

  let(:leagues_file) { File.read('spec/data/leagues.json') }
  let(:response_json) { JSON.parse(leagues_file) }
  let(:leagues) { OpenDotaApi::League.instantiate(response_json) }
  let(:league) { leagues.first }

  it 'returns endpoint' do
    expect(described_class::ENDPOINT).to eq 'leagues'
  end

  it 'inherits entity object' do
    expect(league).to be_a OpenDotaApi::Entity
  end

  it 'is instantiable' do
    expect(league).to be_a OpenDotaApi::Entities::Instantiatable
  end

  describe 'default attributes' do
    it 'returns league id' do
      expect(league.league_id).to eq league_id
    end

    it 'returns ticket' do
      expect(league.ticket).to eq ticket
    end

    it 'returns banner' do
      expect(league.banner).to eq banner
    end

    it 'returns tier' do
      expect(league.tier).to eq tier
    end

    it 'returns name' do
      expect(league.name).to eq name
    end
  end
end

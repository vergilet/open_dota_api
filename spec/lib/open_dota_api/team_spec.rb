require 'spec_helper'

describe OpenDotaApi::Team do
  let(:team_id) { 2163 }
  let(:rating) { 1550.24 }
  let(:wins) { 539 }
  let(:losses) { 355 }
  let(:last_match_time) { 1_500_684_592 }
  let(:name) { 'Team Liquid' }
  let(:tag) { 'Liquid' }

  let(:teams_file) { File.read('spec/data/teams.json') }
  let(:response_json) { JSON.parse(teams_file) }
  let(:teams) { OpenDotaApi::Team.instantiate(response_json) }
  let(:team) { teams.first }

  it 'returns endpoint' do
    expect(described_class::ENDPOINT).to eq 'teams'
  end

  it 'inherits entity object' do
    expect(team).to be_a OpenDotaApi::Entity
  end

  it 'is instantiable' do
    expect(team).to be_a OpenDotaApi::Entities::Instantiatable
  end

  describe 'default attributes' do
    it 'returns team_id' do
      expect(team.team_id).to eq team_id
    end

    it 'returns rating' do
      expect(team.rating).to eq rating
    end

    it 'returns wins' do
      expect(team.wins).to eq wins
    end

    it 'returns losses' do
      expect(team.losses).to eq losses
    end

    it 'returns last match time' do
      expect(team.last_match_time).to eq last_match_time
    end

    it 'returns name' do
      expect(team.name).to eq name
    end

    it 'returns tag' do
      expect(team.tag).to eq tag
    end
  end
end

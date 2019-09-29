require 'spec_helper'

describe OpenDotaApi::Client do
  let(:client) { described_class.new }
  let(:endpoint) {}
  let(:match_id) { 3_149_215_336 }
  let(:league_id) { 5401 }
  let(:leagues_file) { File.read('spec/data/leagues.json') }
  let(:teams_file) { File.read('spec/data/teams.json') }
  let(:match_file) { File.read('spec/data/match.json') }
  let(:heroes_file) { File.read('spec/data/heroes.json') }
  let(:pro_players_file) { File.read('spec/data/pro_players.json') }
  let(:explorer_file) { File.read('spec/data/explorer.json') }
  let(:data_file) {}
  let(:headers) do
    {
      'content-type' => ['application/json; charset=utf-8']
    }
  end

  let(:response_json) { JSON.parse(data_file) }
  let(:expected_leagues) { OpenDotaApi::League.instantiate(response_json) }
  let(:expected_teams) { OpenDotaApi::Team.instantiate(response_json) }
  let(:expected_match) { OpenDotaApi::Match.new(response_json) }
  let(:expected_heroes) { OpenDotaApi::Hero.instantiate(response_json) }
  let(:expected_pro_players) { OpenDotaApi::ProPlayers.instantiate(response_json) }

  let(:api_key) { 'random-value' }
  let(:params) { "" }
  let(:api_url) { "http://api.opendota.com/api/#{endpoint}#{params}" }

  before do
    stub_request(:get, api_url)
      .with(headers: { 'Accept': '*/*', 'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent': 'Ruby' })
      .to_return(status: 200, body: data_file, headers: headers)
  end

  it 'returns interface' do
    expect(OpenDotaApi::Client::INTERFACE).to eq 'api'
  end

  describe 'default attributes' do
    describe '#leagues' do
      let(:endpoint) { OpenDotaApi::League::ENDPOINT }
      let(:data_file) { leagues_file }

      it 'returns array of objects' do
        expect(client.leagues.all? { |league| league.is_a? OpenDotaApi::League }).to be_truthy
      end

      it 'returns list' do
        expect(client.leagues.to_deep_hash).to eq expected_leagues.to_deep_hash
      end
    end

    describe '#teams' do
      let(:endpoint) { OpenDotaApi::Team::ENDPOINT }
      let(:data_file) { teams_file }

      it 'returns array of objects' do
        expect(client.teams.all? { |team| team.is_a? OpenDotaApi::Team }).to be_truthy
      end

      it 'returns list' do
        expect(client.teams.to_deep_hash).to eq expected_teams.to_deep_hash
      end
    end

    describe '#matches' do
      let(:endpoint) { "#{OpenDotaApi::Match::ENDPOINT}/#{match_id}" }
      let(:data_file) { match_file }

      it 'returns object' do
        expect(client.matches(match_id).is_a?(OpenDotaApi::Match)).to be_truthy
      end

      it 'returns match' do
        expect(client.matches(match_id).to_deep_hash).to eq expected_match.to_deep_hash
      end
    end

    describe '#heroes' do
      let(:endpoint) { OpenDotaApi::Hero::ENDPOINT }
      let(:data_file) { heroes_file }

      it 'returns array of objects' do
        expect(client.heroes.all? { |hero| hero.is_a? OpenDotaApi::Hero }).to be_truthy
      end

      it 'returns list' do
        expect(client.heroes.to_deep_hash).to eq expected_heroes.to_deep_hash
      end
    end

    describe '#pro_players' do
      let(:endpoint) { OpenDotaApi::ProPlayer::ENDPOINT }
      let(:data_file) { pro_players_file }

      it 'returns array of objects' do
        expect(client.pro_players.all? { |hero| hero.is_a? OpenDotaApi::ProPlayer }).to be_truthy
      end

      it 'returns list' do
        expect(client.pro_players.to_deep_hash).to eq expected_heroes.to_deep_hash
      end
    end

    describe '#explorer' do
      let(:query) { OpenDotaApi::Explorer.query_params(league_id) }
      let(:endpoint) { "#{OpenDotaApi::Explorer::ENDPOINT}" }
      let(:params) { "?#{query.keys[0]}=#{query.values[0]}" }
      let(:data_file) { explorer_file }

      it 'returns array of match ids' do
        expect(client.explorer(league_id).league_matches_ids.is_a?(Array)).to be_truthy
      end

      context 'API_KEY' do
        let(:params) { "?api_key=#{api_key}&#{query.keys[0]}=#{query.values[0]}" }
        before do
          OpenDotaApi.api_key = api_key
        end

        it 'returns array of match ids' do
          expect(client.explorer(league_id).league_matches_ids.is_a?(Array)).to be_truthy
        end
      end
    end
  end
end

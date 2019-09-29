require 'spec_helper'

describe OpenDotaApi::ProPlayer do
  let(:account_id) { 1_296_625 }
  let(:steam_id) { '76561197961562353' }
  let(:avatar) { 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/95/951e9165740fda890651d8475fc50f5368a847bb.jpg' }
  let(:avatar_medium) { 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/95/951e9165740fda890651d8475fc50f5368a847bb_medium.jpg' }
  let(:avatar_full) { 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/95/951e9165740fda890651d8475fc50f5368a847bb_full.jpg' }
  let(:profile_url) { 'http://steamcommunity.com/id/jnewsham/' }
  let(:persona_name) { 'Newsham' }
  let(:last_login) { Time.parse('2016-06-10 20:24:48.743000000 +0000').utc }
  let(:full_history_time) { Time.parse('2015-10-27 05:14:26.768000000 +0000') }
  let(:cheese) { 0 }
  let(:fh_unavailable) { false }
  let(:loc_country_code) { 'US' }
  let(:last_match_time) { Time.parse('2017-06-28 03:13:57.000000000 +0000') }
  let(:name) { 'Newsham' }
  let(:country_code) { 'us' }
  let(:fantasy_role) { 2 }
  let(:team_id) { 3_724_222 }
  let(:team_name) { 'Team Red' }
  let(:team_tag) { 'Red' }
  let(:is_locked) { true }
  let(:is_pro) { true }
  let(:locked_until) { 1_502_694_000 }

  let(:pro_players_file) { File.read('spec/data/pro_players.json') }
  let(:response_json) { JSON.parse(pro_players_file) }
  let(:pro_players) { OpenDotaApi::ProPlayer.instantiate(response_json) }
  let(:pro_player) { pro_players.first } # Red.Newsham

  it 'returns endpoint' do
    expect(described_class::ENDPOINT).to eq 'proPlayers'
  end

  it 'inherits entity object' do
    expect(pro_player).to be_a OpenDotaApi::Entity
  end

  it 'is instantiable' do
    expect(pro_player).to be_a OpenDotaApi::Entities::Instantiatable
  end

  describe 'default attributes' do
    it 'returns account id' do
      expect(pro_player.account_id).to eq account_id
    end

    it 'returns steam id' do
      expect(pro_player.steam_id).to eq steam_id
    end

    it 'returns avatar' do
      expect(pro_player.avatar).to eq avatar
    end

    it 'returns avatar medium' do
      expect(pro_player.avatar_medium).to eq avatar_medium
    end

    it 'returns avatar full' do
      expect(pro_player.avatar_full).to eq avatar_full
    end

    it 'returns profile url' do
      expect(pro_player.profile_url).to eq profile_url
    end

    it 'returns persona name' do
      expect(pro_player.persona_name).to eq persona_name
    end

    it 'returns last login' do
      expect(pro_player.last_login).to eq last_login
    end

    it 'returns full history time' do
      expect(pro_player.full_history_time).to eq full_history_time
    end

    it 'returns cheese' do
      expect(pro_player.cheese).to eq cheese
    end

    it 'returns fh unavailable' do
      expect(pro_player.fh_unavailable).to eq fh_unavailable
    end

    it 'returns location country code' do
      expect(pro_player.loc_country_code).to eq loc_country_code
    end

    it 'returns last match time' do
      expect(pro_player.last_match_time).to eq last_match_time
    end

    it 'returns name' do
      expect(pro_player.name).to eq name
    end

    it 'returns country code' do
      expect(pro_player.country_code).to eq country_code
    end

    it 'returns fantasy role' do
      expect(pro_player.fantasy_role).to eq fantasy_role
    end

    it 'returns team id' do
      expect(pro_player.team_id).to eq team_id
    end

    it 'returns team name' do
      expect(pro_player.team_name).to eq team_name
    end

    it 'returns team tag' do
      expect(pro_player.team_tag).to eq team_tag
    end

    it 'returns if it is locked' do
      expect(pro_player.locked?).to eq is_locked
    end

    it 'returns if it is pro' do
      expect(pro_player.pro?).to eq is_pro
    end

    it 'returns locked until' do
      expect(pro_player.locked_until).to eq locked_until
    end
  end
end

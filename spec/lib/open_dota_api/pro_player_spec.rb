require 'spec_helper'

describe OpenDotaApi::ProPlayer do
  let(:account_id) { 1 }
  let(:steam_id) { 'npc_dota_pro_player_antimage' }
  let(:avatar) { 'Anti-Mage' }
  let(:avatar_medium) { 'Anti-Mage' }
  let(:avatar_full) { 'Anti-Mage' }
  let(:profile_url) { 'Anti-Mage' }
  let(:persona_name) { 'Anti-Mage' }
  let(:last_login) { 'Anti-Mage' }
  let(:full_history_time) { 'Anti-Mage' }
  let(:cheese) { 'Anti-Mage' }
  let(:fh_unavailable) { 'Anti-Mage' }
  let(:loc_country_code) { 'Anti-Mage' }
  let(:last_match_time) { 'Anti-Mage' }
  let(:name) { 'Anti-Mage' }
  let(:country_code) { 'Anti-Mage' }
  let(:fantasy_role) { 'Anti-Mage' }
  let(:team_id) { 'Anti-Mage' }
  let(:team_name) { 'Anti-Mage' }
  let(:team_tag) { 'Anti-Mage' }
  let(:is_locked) { 'Anti-Mage' }
  let(:is_pro) { 'Anti-Mage' }
  let(:locked_until) { 'Anti-Mage' }


  let(:pro_players_file) { File.read('spec/data/pro_players.json') }
  let(:response_json) { JSON.parse(pro_players_file) }
  let(:pro_players) { OpenDotaApi::ProPlayer.instantiate(response_json) }
  let(:pro_player) { pro_players[433] }

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
      expect(pro_player.is_locked).to eq is_locked
    end

    it 'returns if it is pro' do
      expect(pro_player.is_pro).to eq is_pro
    end

    it 'returns locked until' do
      expect(pro_player.locked_until).to eq locked_until
    end
  end
end

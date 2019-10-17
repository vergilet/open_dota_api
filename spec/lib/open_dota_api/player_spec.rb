require 'spec_helper'

describe OpenDotaApi::Player do
  let(:account_id) { 65366604 }
  let(:steam_id) { '76561198025632332' }
  let(:avatar) { "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/40/4097bbe60170972397ee8cbe5694632ec339a9cc.jpg" }
  let(:avatar_medium) { "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/40/4097bbe60170972397ee8cbe5694632ec339a9cc_medium.jpg" }
  let(:avatar_full) { "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/40/4097bbe60170972397ee8cbe5694632ec339a9cc_full.jpg" }
  let(:profile_url) { "https://steamcommunity.com/id/HopeYouDie/" }
  let(:persona_name) { "Misaka 10032" }
  let(:name) { nil }
  let(:last_login) { Time.parse('2019-09-23 08:55:01.422000000 +0000').utc }
  let(:cheese) { 0 }
  let(:mmr_estimate) { 2696 }
  let(:plus) { false }
  let(:loc_country_code) { 'PL' }
  let(:is_contributor) { false }

  let(:player_file) { File.read('spec/data/player.json') }
  let(:response_json) { JSON.parse(player_file) }
  let(:player) { OpenDotaApi::Player.new(response_json) }

  it 'returns endpoint' do
    expect(described_class::ENDPOINT).to eq 'players'
  end

  it 'inherits entity object' do
    expect(player).to be_a OpenDotaApi::Entity
  end

  it 'is not instantiable' do
    expect { described_class.instantiate }.to raise_error NotImplementedError
  end

  describe 'default attributes' do
    it 'returns account id' do
      expect(player.account_id).to eq account_id
    end

    it 'returns mmr estimate' do
      expect(player.mmr_estimate).to eq mmr_estimate
    end

    it 'returns plus' do
      expect(player.plus).to eq plus
    end

    it 'returns is contributor' do
      expect(player.contributor?).to eq is_contributor
    end

    it 'returns steam id' do
      expect(player.steam_id).to eq steam_id
    end

    it 'returns avatar' do
      expect(player.avatar).to eq avatar
    end

    it 'returns avatar medium' do
      expect(player.avatar_medium).to eq avatar_medium
    end

    it 'returns avatar full' do
      expect(player.avatar_full).to eq avatar_full
    end

    it 'returns profile url' do
      expect(player.profile_url).to eq profile_url
    end

    it 'returns persona name' do
      expect(player.persona_name).to eq persona_name
    end

    it 'returns last login' do
      expect(player.last_login).to eq last_login
    end

    it 'returns cheese' do
      expect(player.cheese).to eq cheese
    end

    it 'returns location country code' do
      expect(player.loc_country_code).to eq loc_country_code
    end

    it 'returns name' do
      expect(player.name).to eq name
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe OpenDotaApi::Matches::Player do
  let(:match_id) { 3_149_215_336 }
  let(:player_slot) { 0 }
  let(:account_id) { 94_155_156 }
  let(:assists) { 13 }
  let(:camps_stacked) { 4 }
  let(:deaths) { 7 }
  let(:denies) { 1 }
  let(:gold_per_min) { 329 }
  let(:hero_id) { 110 }
  let(:kills) { 6 }
  let(:obs_placed) { 7 }
  let(:sen_placed) { 19 }
  let(:rune_pickups) { 9 }
  let(:stuns) { 0 }
  let(:xp_per_min) { 385 }
  let(:name) { 'Fly' }
  let(:side) { :radiant }
  let(:kda) { 2 }
  let(:tower_kills) { 0 }
  let(:roshan_kills) { 0 }
  let(:hero_healing) { 606 }
  let(:last_hits) { 73 }
  let(:firstblood_claimed) { nil }
  let(:hero_damage) { 13_406 }
  let(:teamfight_participation) { nil }

  let(:match_file) { File.read('spec/data/match.json') }
  let(:response_json) { JSON.parse(match_file) }
  let(:match) { OpenDotaApi::Match.new(response_json) }
  let(:players) { match.players }
  let(:player) { players.first }

  it 'inherits entity object' do
    expect(player).to be_a OpenDotaApi::Entity
  end

  it 'is instantiable' do
    expect(player).to be_a OpenDotaApi::Entities::Instantiatable
  end

  describe 'default attributes' do
    it 'returns match id' do
      expect(player.match_id).to eq match_id
    end

    it 'returns player slot' do
      expect(player.player_slot).to eq player_slot
    end

    it 'returns account id' do
      expect(player.account_id).to eq account_id
    end

    it 'returns assists' do
      expect(player.assists).to eq assists
    end

    it 'returns camps stacked' do
      expect(player.camps_stacked).to eq camps_stacked
    end

    it 'returns deaths' do
      expect(player.deaths).to eq deaths
    end

    it 'returns denies' do
      expect(player.denies).to eq denies
    end

    it 'returns gold per minute' do
      expect(player.gold_per_min).to eq gold_per_min
    end

    it 'returns hero id' do
      expect(player.hero_id).to eq hero_id
    end

    it 'returns kills' do
      expect(player.kills).to eq kills
    end

    it 'returns observer wards placed' do
      expect(player.obs_placed).to eq obs_placed
    end

    it 'returns sentry wards placed' do
      expect(player.sen_placed).to eq sen_placed
    end

    it 'returns rune pickups' do
      expect(player.rune_pickups).to eq rune_pickups
    end

    it 'returns stuns' do
      expect(player.stuns).to eq stuns
    end

    it 'returns experience points per minute' do
      expect(player.xp_per_min).to eq xp_per_min
    end

    it 'returns name' do
      expect(player.name).to eq name
    end

    it 'returns side' do
      expect(player.side).to eq side
    end

    it 'returns kda' do
      expect(player.kda).to eq kda
    end

    it 'returns tower kills' do
      expect(player.tower_kills).to eq tower_kills
    end

    it 'returns roshan kills' do
      expect(player.roshan_kills).to eq roshan_kills
    end

    it 'returns hero healing' do
      expect(player.hero_healing).to eq hero_healing
    end

    it 'returns last hits' do
      expect(player.last_hits).to eq last_hits
    end

    it 'returns firstblood claimed' do
      expect(player.firstblood_claimed).to eq firstblood_claimed
    end

    it 'returns hero damage' do
      expect(player.hero_damage).to eq hero_damage
    end

    it 'returns teamfight participation' do
      expect(player.teamfight_participation).to eq teamfight_participation
    end
  end
end

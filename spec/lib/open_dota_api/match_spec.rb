require 'spec_helper'

describe OpenDotaApi::Match do
  context 'official match' do
    let(:match_id) { 3_149_215_336 }
    let(:start_time) { 1_493_566_333 }
    let(:duration) { 2109 }
    let(:series_id) { 135_248 }
    let(:series_type) { 2 }
    let(:radiant_team_id) { 2_586_976 }
    let(:dire_team_id) { 1_883_502 }
    let(:match_seq_num) { 2_750_393_746 }
    let(:league_id) { 5157 }
    let(:first_blood_time) { 53 }
    let(:winner) { :dire }
    let(:cluster) { 136 }
    let(:replay_salt) { 565_926_067 }
    let(:replay_url) { 'http://replay136.valve.net/570/3149215336_565926067.dem.bz2' }
    let(:players_length) { 10 }
    let(:radiant_score) { 27 }
    let(:dire_score) { 29 }
    let(:player_class) { OpenDotaApi::Matches::Player }

    let(:match_file) { File.read('spec/data/match.json') }
    let(:response_json) { JSON.parse(match_file) }
    let(:match) { OpenDotaApi::Match.new(response_json) }

    it 'returns endpoint' do
      expect(described_class::ENDPOINT).to eq 'matches'
    end

    it 'inherits entity object' do
      expect(match).to be_a OpenDotaApi::Entity
    end

    describe 'default attributes' do
      it 'returns match id' do
        expect(match.match_id).to eq match_id
      end

      it 'returns start time' do
        expect(match.start_time).to eq start_time
      end

      it 'returns duration' do
        expect(match.duration).to eq duration
      end

      it 'returns series id' do
        expect(match.series_id).to eq series_id
      end

      it 'returns series type' do
        expect(match.series_type).to eq series_type
      end

      it 'returns radiant team id' do
        expect(match.radiant_team_id).to eq radiant_team_id
      end

      it 'returns dire team id' do
        expect(match.dire_team_id).to eq dire_team_id
      end

      it 'returns match sequence number' do
        expect(match.match_seq_num).to eq match_seq_num
      end

      it 'returns league id' do
        expect(match.league_id).to eq league_id
      end

      it 'returns first blood time' do
        expect(match.first_blood_time).to eq first_blood_time
      end

      it 'returns winner' do
        expect(match.winner).to eq winner
      end

      it 'returns cluster' do
        expect(match.cluster).to eq cluster
      end

      it 'returns replay salt' do
        expect(match.replay_salt).to eq replay_salt
      end

      it 'returns replay url' do
        expect(match.replay_url).to eq replay_url
      end

      it 'returns players' do
        expect(match.players.length).to eq players_length
        expect(match.players.all? { |player| player.is_a? player_class }).to be_truthy
      end

      it 'returns radiant score' do
        expect(match.radiant_score).to eq radiant_score
      end

      it 'returns dire score' do
        expect(match.dire_score).to eq dire_score
      end
    end
  end

  context 'unofficial match' do
    let(:match_id) { 3_344_092_796 }
    let(:start_time) { 1_501_349_085 }
    let(:duration) { 2590 }
    let(:series_id) { 0 }
    let(:series_type) { 0 }
    let(:radiant_team_id) { nil }
    let(:dire_team_id) { nil }
    let(:match_seq_num) { 2_917_433_466 }
    let(:league_id) { 0 }
    let(:first_blood_time) { 2 }
    let(:winner) { :dire }
    let(:cluster) { 192 }
    let(:replay_salt) { 120_334_496 }
    let(:replay_url) { 'http://replay192.valve.net/570/3344092796_120334496.dem.bz2' }
    let(:players_length) { 10 }
    let(:radiant_score) { 29 }
    let(:dire_score) { 32 }
    let(:player_class) { OpenDotaApi::Matches::Player }

    let(:match_file) { File.read('spec/data/unofficial_match.json') }
    let(:response_json) { JSON.parse(match_file) }
    let(:match) { OpenDotaApi::Match.new(response_json) }

    it 'returns endpoint' do
      expect(described_class::ENDPOINT).to eq 'matches'
    end

    it 'inherits entity object' do
      expect(match).to be_a OpenDotaApi::Entity
    end

    describe 'default attributes' do
      it 'returns match id' do
        expect(match.match_id).to eq match_id
      end

      it 'returns start time' do
        expect(match.start_time).to eq start_time
      end

      it 'returns duration' do
        expect(match.duration).to eq duration
      end

      it 'returns series id' do
        expect(match.series_id).to eq series_id
      end

      it 'returns series type' do
        expect(match.series_type).to eq series_type
      end

      it 'returns radiant team id' do
        expect(match.radiant_team_id).to eq radiant_team_id
      end

      it 'returns dire team id' do
        expect(match.dire_team_id).to eq dire_team_id
      end

      it 'returns match sequence number' do
        expect(match.match_seq_num).to eq match_seq_num
      end

      it 'returns league id' do
        expect(match.league_id).to eq league_id
      end

      it 'returns first blood time' do
        expect(match.first_blood_time).to eq first_blood_time
      end

      it 'returns winner' do
        expect(match.winner).to eq winner
      end

      it 'returns cluster' do
        expect(match.cluster).to eq cluster
      end

      it 'returns replay salt' do
        expect(match.replay_salt).to eq replay_salt
      end

      it 'returns replay url' do
        expect(match.replay_url).to eq replay_url
      end

      it 'returns radiant score' do
        expect(match.radiant_score).to eq radiant_score
      end

      it 'returns dire score' do
        expect(match.dire_score).to eq dire_score
      end

      it 'returns players' do
        expect(match.players.length).to eq players_length
        expect(match.players.all? { |player| player.is_a? player_class }).to be_truthy
      end
    end
  end
end

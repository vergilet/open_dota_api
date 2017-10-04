require 'open_dota_api/entity'
require 'open_dota_api/matches/player'

module OpenDotaApi
  class Match < Entity
    ENDPOINT = 'matches'.freeze

    def self.instantiate(_ = nil)
      raise NotImplementedError
    end

    def match_id
      data['match_id']
    end

    def start_time
      data['start_time']
    end

    def duration
      data['duration']
    end

    def series_id
      data['series_id']
    end

    def series_type
      data['series_type']
    end

    def radiant_team_id
      data.dig('radiant_team', 'team_id')
    end

    def dire_team_id
      data.dig('dire_team', 'team_id')
    end

    def match_seq_num
      data['match_seq_num']
    end

    def league_id
      data['leagueid']
    end

    def first_blood_time
      data['first_blood_time']
    end

    def winner
      data['radiant_win'] ? :radiant : :dire
    end

    def cluster
      data['cluster']
    end

    def replay_salt
      data['replay_salt']
    end

    def replay_url
      "http://replay#{cluster}.valve.net/570/#{match_id}_#{replay_salt}.dem.bz2"
    end

    def players
      Player.instantiate(data['players'])
    end

    def radiant_score
      data['radiant_score']
    end

    def dire_score
      data['dire_score']
    end

    class Player < Matches::Player; end
  end
end

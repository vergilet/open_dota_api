require 'open_dota_api/entity'
require 'open_dota_api/matches/player'
require 'open_dota_api/matches/pick_ban'

module OpenDotaApi
  class Match < Entity
    ENDPOINT = 'matches'.freeze

    define_child_entity Matches::PickBan, 'picks_bans'
    define_child_entity Matches::Player, 'players'

    def radiant_team_id
      data.dig('radiant_team', 'team_id')
    end

    def dire_team_id
      data.dig('dire_team', 'team_id')
    end

    def league_id
      leagueid
    end

    def winner
      data['radiant_win'] ? :radiant : :dire
    end
  end
end

require 'open_dota_api/connection'
require 'open_dota_api/league'
require 'open_dota_api/team'
require 'open_dota_api/match'
require 'open_dota_api/hero'
require 'open_dota_api/pro_player'
require 'open_dota_api/explorer'

module OpenDotaApi
  class Client
    INTERFACE = 'api'.freeze

    def leagues
      leagues_data = request(League::ENDPOINT)
      return {} unless leagues_data
      League.instantiate(leagues_data)
    end

    def teams
      teams_data = request(Team::ENDPOINT)
      return {} unless teams_data
      Team.instantiate(teams_data)
    end

    def matches(match_id = nil)
      match_data = request(Match::ENDPOINT, match_id)
      return {} unless match_data
      Match.new(match_data)
    end

    def heroes
      heroes_data = request(Hero::ENDPOINT)
      return {} unless heroes_data
      Hero.instantiate(heroes_data)
    end

    def pro_players
      pro_players_data = request(ProPlayer::ENDPOINT)
      return {} unless pro_players_data
      ProPlayer.instantiate(pro_players_data)
    end

    def explorer(league_id = nil)
      explorer_data = request(Explorer::ENDPOINT, query_params: Explorer.query_params(league_id))
      return {} unless explorer_data
      Explorer.new(explorer_data)
    end

    private

    def connection
      @connection ||= Connection.new
    end


    def request(method, argument= nil, query_params: nil)
      argument = argument ? argument.to_s.concat('/') : nil
      pathname = "/#{INTERFACE}/#{method}/#{argument}"
      connection.get(pathname, query: query_params)
    end
  end
end

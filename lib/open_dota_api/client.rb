require 'open_dota_api/connection'
require 'open_dota_api/league'
require 'open_dota_api/team'
require 'open_dota_api/match'
require 'open_dota_api/hero'

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

    private

    def connection
      @connection ||= Connection.new
    end

    def request(method, argument = nil)
      argument = argument ? argument.to_s.concat('/') : nil
      pathname = "/#{INTERFACE}/#{method}/#{argument}"
      connection.get(pathname)
    end
  end
end

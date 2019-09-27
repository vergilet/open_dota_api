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

    def leagues(attributes = {})
      leagues_data = request(League::ENDPOINT, query_params: { api_key: attributes.slice(:api_key) })
      return {} unless leagues_data.success?
      League.instantiate(leagues_data)
    end

    def teams(attributes = {})
      teams_data = request(Team::ENDPOINT, query_params: { api_key: attributes.slice(:api_key) })
      return {} unless teams_data.success?
      Team.instantiate(teams_data)
    end

    def matches(match_id = nil, attributes = {})
      match_data = request(Match::ENDPOINT, match_id, query_params: { api_key: attributes.slice(:api_key) })
      return {} unless match_data.success?
      Match.new(match_data)
    end

    def heroes(attributes = {})
      heroes_data = request(Hero::ENDPOINT, query_params: { api_key: attributes.slice(:api_key) })
      return {} unless heroes_data.success?
      Hero.instantiate(heroes_data)
    end

    def pro_players(attributes = {})
      pro_players_data = request(ProPlayer::ENDPOINT, query_params: { api_key: attributes.slice(:api_key) })
      return {} unless pro_players_data
      ProPlayer.instantiate(pro_players_data)
    end

    def explorer(league_id = nil, attributes = {})
      explorer_data = request(Explorer::ENDPOINT, query_params: { api_key: attributes.slice(:api_key) }.merge(Explorer.query_params(league_id)))
      return {} unless explorer_data.success?
      Explorer.new(explorer_data)
    end

    private

    def connection
      @connection ||= Connection.new
    end

    def request(method, argument = nil, query_params: {})

      params = query_params.merge({ api_key: OpenDotaApi.api_key }.compact)
      argument = argument ? argument.to_s.concat('/') : nil
      pathname = "/#{INTERFACE}/#{method}/#{argument}"

      connection.get(pathname, query: params)
    end
  end
end

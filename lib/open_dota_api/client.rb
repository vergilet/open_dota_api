require 'open_dota_api/connection'
require 'open_dota_api/health'
require 'open_dota_api/league'
require 'open_dota_api/team'
require 'open_dota_api/match'
require 'open_dota_api/hero'
require 'open_dota_api/pro_player'
require 'open_dota_api/explorer'

module OpenDotaApi
  class Client
    INTERFACE = 'api'.freeze

    def limits(attributes = {})
      return @limits unless @limits.nil?

      request(Health::ENDPOINT, params: attributes)
      @limits
    end

    def leagues(attributes = {})
      data = request(League::ENDPOINT, params: attributes)
      League.instantiate(data)
    end

    def teams(attributes = {})
      data = request(Team::ENDPOINT, params: attributes)
      Team.instantiate(data)
    end

    def matches(match_id = nil, attributes = {})
      data = request(Match::ENDPOINT, match_id, params: attributes)
      Match.new(data)
    end

    def heroes(attributes = {})
      data = request(Hero::ENDPOINT, params: attributes)
      Hero.instantiate(data)
    end

    def pro_players(attributes = {})
      data = request(ProPlayer::ENDPOINT, params: attributes)
      ProPlayer.instantiate(data)
    end

    def explorer(league_id = nil, attributes = {})
      data = request(Explorer::ENDPOINT, params: Explorer.query_params(league_id).merge(attributes))
      Explorer.new(data)
    end

    private

    def connection
      @connection ||= Connection.new
    end

    def request(method, argument = nil, params: {})
      pathname = "/#{INTERFACE}/#{method}#{("/#{argument}" if argument)}"

      global_api_key = { api_key: OpenDotaApi.api_key }.compact

      data = connection.get(pathname, query: global_api_key.merge(params.compact))
      return {} unless data.success?

      limits_fixation(data)
      data
    end

    def limits_fixation(data)
      @limits = {
        per_min: data.headers['x-rate-limit-remaining-minute'],
        per_month: data.headers['x-rate-limit-remaining-month']
      }
    end
  end
end

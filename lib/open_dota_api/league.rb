# frozen_string_literal: true

require 'open_dota_api/entity'

module OpenDotaApi
  class League < Entity
    ENDPOINT = 'leagues'

    def league_id
      data['leagueid']
    end

    def ticket
      data['ticket']
    end

    def banner
      data['banner']
    end

    def tier
      data['tier']
    end

    def name
      data['name']
    end
  end
end

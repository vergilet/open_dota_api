# frozen_string_literal: true

require 'open_dota_api/entity'

module OpenDotaApi
  class Explorer < Entity
    ENDPOINT = 'explorer'

    def self.instantiate(_ = nil)
      raise NotImplementedError
    end

    def self.query_params(league_id)
      {
        sql: "SELECT matches.match_id FROM matches WHERE matches.leagueid = #{league_id} ORDER BY matches.match_id LIMIT 20000"
      }
    end

    def league_matches_ids
      data['rows'].map { |obj| obj['match_id'] }
    end
  end
end

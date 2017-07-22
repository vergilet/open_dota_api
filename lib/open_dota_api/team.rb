require 'open_dota_api/entity'

module OpenDotaApi
  class Team < Entity
    include Entities::Instantiatable

    ENDPOINT = 'teams'.freeze

    def team_id
      data['team_id']
    end

    def rating
      data['rating']
    end

    def wins
      data['wins']
    end

    def losses
      data['losses']
    end

    def last_match_time
      data['last_match_time']
    end

    def name
      data['name']
    end

    def tag
      data['tag']
    end
  end
end

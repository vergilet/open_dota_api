require 'open_dota_api/entity'

module OpenDotaApi
  class Team < Entity
    ENDPOINT = 'teams'.freeze
    define_adder(%w(team_id rating wins losses last_match_time name tag))
  end
end

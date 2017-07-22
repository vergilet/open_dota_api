require 'open_dota_api/entity'

module OpenDotaApi
  class Team < Entity
    include Entities::Instantiatable
    ENDPOINT = 'teams'.freeze
    ATTRIBUTES = %w[team_id rating wins losses last_match_time name tag].freeze
    extend Entities::Definable
    define_adder(ATTRIBUTES)
  end
end

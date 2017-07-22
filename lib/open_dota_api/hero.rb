require 'open_dota_api/entity'

module OpenDotaApi
  class Hero < Entity
    include Entities::Instantiatable
    ENDPOINT = 'heroes'.freeze
    ATTRIBUTES = %w[id name localized_name primary_attr attack_type roles legs].freeze
    extend Entities::Definable
    define_adder(ATTRIBUTES)
  end
end

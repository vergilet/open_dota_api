require 'open_dota_api/entity'

module OpenDotaApi
  class Hero < Entity
    ENDPOINT = 'heroes'.freeze
    extend Entities::Definable
    define_adder(%w[id name localized_name primary_attr attack_type roles legs])
  end
end

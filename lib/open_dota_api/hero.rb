# frozen_string_literal: true

require 'open_dota_api/entity'

module OpenDotaApi
  class Hero < Entity
    ENDPOINT = 'heroes'
    define_adder(%w[id name localized_name primary_attr attack_type roles legs])
  end
end

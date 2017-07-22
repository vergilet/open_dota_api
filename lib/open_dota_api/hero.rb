require 'open_dota_api/entity'

module OpenDotaApi
  class Hero < Entity
    include Entities::Instantiatable

    ENDPOINT = 'heroes'.freeze

    def id
      data['id']
    end

    def name
      data['name']
    end

    def localized_name
      data['localized_name']
    end

    def primary_attr
      data['primary_attr']
    end

    def attack_type
      data['attack_type']
    end

    def roles
      data['roles']
    end

    def legs
      data['legs']
    end
  end
end

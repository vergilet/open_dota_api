require 'open_dota_api/entity'

module OpenDotaApi
  class Player < Entity
    ENDPOINT = 'players'.freeze

    define_adder(%w[tracked_until rank_tier competitive_rank solo_competitive_rank leaderboard_rank])

    def self.instantiate(_ = nil)
      raise NotImplementedError
    end

    def mmr_estimate
      data&.dig('mmr_estimate', 'estimate')
    end

    # profile section
    def persona_name
      data&.dig('profile', 'personaname')
    end

    def account_id
      data&.dig('profile', 'account_id')
    end

    def name
      data&.dig('profile', 'name')
    end

    def plus
      data&.dig('profile', 'plus')
    end

    def cheese
      data&.dig('profile', 'cheese')
    end

    def avatar
      data&.dig('profile', 'avatar')
    end

    def contributor?
      data&.dig('profile', 'is_contributor')
    end

    def steam_id
      data&.dig('profile', 'steamid')
    end

    def avatar_medium
      data&.dig('profile', 'avatarmedium')
    end

    def avatar_full
      data&.dig('profile', 'avatarfull')
    end

    def profile_url
      data&.dig('profile', 'profileurl')
    end

    def last_login
      Time.parse(data&.dig('profile', 'last_login'))
    end

    def loc_country_code
      data&.dig('profile', 'loccountrycode')
    end
  end
end

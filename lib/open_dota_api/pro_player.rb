# frozen_string_literal: true

require 'open_dota_api/entity'

module OpenDotaApi
  class ProPlayer < Entity
    ENDPOINT = 'proPlayers'
    def account_id
      data['account_id']
    end

    def steam_id
      data['steamid']
    end

    def avatar
      data['avatar']
    end

    def avatar_medium
      data['avatarmedium']
    end

    def avatar_full
      data['avatarfull']
    end

    def profile_url
      data['profileurl']
    end

    def persona_name
      data['personaname']
    end

    def last_login
      Time.parse(data['last_login'])
    end

    def full_history_time
      Time.parse(data['full_history_time'])
    end

    def cheese
      data['cheese']
    end

    def fh_unavailable
      data['fh_unavailable']
    end

    def loc_country_code
      data['loccountrycode']
    end

    def last_match_time
      Time.parse(data['last_match_time'])
    end

    def name
      data['name']
    end

    def country_code
      data['country_code']
    end

    def fantasy_role
      data['fantasy_role']
    end

    def team_id
      data['team_id']
    end

    def team_name
      data['team_name']
    end

    def team_tag
      data['team_tag']
    end

    def locked?
      data['is_locked']
    end

    def pro?
      data['is_pro']
    end

    def locked_until
      data['locked_until']
    end
  end
end

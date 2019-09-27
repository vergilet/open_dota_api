# frozen_string_literal: true

require 'httparty'

module OpenDotaApi
  class Connection
    include HTTParty
    base_uri 'api.opendota.com'

    def get(pathname, options = {})
      self.class.get(pathname, options)
    end
  end
end

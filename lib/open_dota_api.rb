require 'open_dota_api/client'

module OpenDotaApi
  extend SingleForwardable
  def_delegators :client, :leagues, :teams, :matches, :heroes

  def self.client
    @client ||= Client.new
  end
end

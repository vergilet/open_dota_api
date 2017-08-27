require 'open_dota_api/client'
require 'open_dota_api/version'

module OpenDotaApi
  extend SingleForwardable
  def_delegators :client, :leagues, :teams, :matches, :heroes, :pro_players, :explorer

  def self.client
    @client ||= Client.new
  end
end

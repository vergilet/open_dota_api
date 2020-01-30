require 'open_dota_api/client'
require 'open_dota_api/version'

module OpenDotaApi
  extend SingleForwardable
  def_delegators :client, :limits, :leagues, :teams, :matches, :heroes, :pro_players, :players, :explorer

  def self.client
    @client ||= Client.new
  end

  class << self
    attr_accessor :api_key
  end
end

require 'open_dota_api/entities/instantiable'
require 'hashable'

module OpenDotaApi
  class Entity
    include ::Hashable

    def initialize(data)
      @data = data
    end

    private

    attr_reader :data
  end
end

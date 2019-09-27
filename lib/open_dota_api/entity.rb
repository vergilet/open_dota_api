# frozen_string_literal: true

require 'open_dota_api/entities/instantiable'
require 'hashable'

module OpenDotaApi
  class Entity
    include Entities::Instantiatable
    include ::Hashable

    def self.define_adder(attributes)
      attributes.each do |attribute|
        define_method(attribute) { data[attribute] }
      end
    end

    def initialize(data)
      @data = data
    end

    private

    attr_reader :data
  end
end

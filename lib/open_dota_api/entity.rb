require 'open_dota_api/entities/instantiable'
require 'hashable'

module OpenDotaApi
  class Entity
    include Entities::Instantiatable
    include ::Hashable

    def self.define_adder(attributes)
      attributes.each do |attribute|
        define_method(attribute) { data[attribute] } unless method_defined?(attribute)
      end
    end

    def self.define_child_entity(entity_klass, attribute)
      define_method(attribute) do
        ivar_name = "@#{attribute}"
        if instance_variable_defined?(ivar_name)
          instance_variable_get(ivar_name)
        else
          instance_variable_set(ivar_name, entity_klass.instantiate(data[attribute]))
        end
      end
    end

    def initialize(data)
      @data = data
      self.class.define_adder(data.keys)
    end

    private

    attr_reader :data
  end
end

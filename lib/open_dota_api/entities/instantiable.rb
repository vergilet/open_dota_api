module OpenDotaApi
  module Entities
    module Instantiatable
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def instantiate(data)
          return new(data) if data.respond_to?(:keys)
          return data.map { |data_instance| new(data_instance) } if data.respond_to?(:map)
          raise ArgumentError.new "data passed to instantiate must be a hash or an array"
        end
      end
    end
  end
end

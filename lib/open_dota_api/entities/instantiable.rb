module OpenDotaApi
  module Entities
    module Instantiatable
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def instantiate(data)
          return new(data) if data.respond_to?(:keys)

          data.map { |data_instance| new(data_instance) }
        end
      end
    end
  end
end

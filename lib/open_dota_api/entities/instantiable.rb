# frozen_string_literal: true

module OpenDotaApi
  module Entities
    module Instantiatable
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def instantiate(data)
          data.map { |data_instance| new(data_instance) }
        end
      end
    end
  end
end

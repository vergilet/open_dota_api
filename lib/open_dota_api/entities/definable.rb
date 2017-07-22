module OpenDotaApi
  module Entities
    module Definable
      def define_adder(attributes)
        attributes.each do |attribute|
          define_method(attribute) { data[attribute] }
        end
      end
    end
  end
end

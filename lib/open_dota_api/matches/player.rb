require 'open_dota_api/entity'

module OpenDotaApi
  module Matches
    class Player < Entity
      def side
        data['isRadiant'] ? :radiant : :dire
      end
    end
  end
end

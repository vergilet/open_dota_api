module OpenDotaApi
  module Matches
    class PickBan < Entity
      def pick?
        data['is_pick']
      end

      def ban?
        !pick?
      end

      def team
        data['team'].zero? ? :radiant : :dire
      end
    end
  end
end

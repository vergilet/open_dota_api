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
        data['team'] == 0 ? :radiant : :dire
      end
    end
  end
end
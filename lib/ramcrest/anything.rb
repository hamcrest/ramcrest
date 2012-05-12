require 'ramcrest/match'

module Ramcrest
  module Anything
    def anything
      AnythingMatcher.new
    end

    class AnythingMatcher
      def matches?(actual)
        Ramcrest::Match.success
      end

      def describe
        "anything"
      end
    end
  end
end

require 'ramcrest/match'

module Ramcrest
  module Anything
    def anything
      AnythingMatcher.new
    end

    class AnythingMatcher
      def matches?(actual)
        success
      end

      def description
        "anything"
      end

      private
      include Ramcrest::Match
    end
  end
end

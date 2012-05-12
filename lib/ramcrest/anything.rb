require 'ramcrest/match'

module Ramcrest
  module Anything
    module_function

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

      include Ramcrest::Match
    end
  end
end

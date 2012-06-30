require 'ramcrest/match'

module Ramcrest
  module Anything
    module_function

    def anything
      Matcher.new
    end

    class Matcher
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

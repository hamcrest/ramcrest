require 'ramcrest/match'

module Ramcrest
  module Aint
  module_function
    def aint(expected)
      Matcher.new(Ramcrest::EqualTo.to_matcher(expected))
    end

    class Matcher
      include Ramcrest::Match

      def initialize(expected)
        @expected = expected
      end

      def do_match(actual)
        @expected.matches?(actual).negate!
      end

      def mismatch_message(actual, match)
        "<#{actual}>"
      end

      def description
        "not #{@expected.description}"
      end

      def matches?(actual)
        match = do_match(actual)
        if match.matched?
          success
        else
          mismatch(mismatch_message(actual, match))
        end
      end
    end
  end
end

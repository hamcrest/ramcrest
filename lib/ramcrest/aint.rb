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

      def matches?(actual)
        match = @expected.matches?(actual)
        if match.matched?
          mismatch("<#{actual}>")
        else
          success
        end
      end

      def description
        "not #{@expected.description}"
      end
    end
  end
end

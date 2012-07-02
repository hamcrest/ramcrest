require 'ramcrest/matcher'

module Ramcrest
  module Aint
  module_function
    def aint(expected)
      Matcher.new(Ramcrest::EqualTo.to_matcher(expected))
    end

    class Matcher
      include Ramcrest::Matcher

      def initialize(expected)
        @expected = expected
      end

      def do_match(expected, actual)
        super.negate!
      end

      def mismatch_message(actual, match)
        "<#{actual}>"
      end

      def description
        "not #{@expected.description}"
      end
    end
  end
end

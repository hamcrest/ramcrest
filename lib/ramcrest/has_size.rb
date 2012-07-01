require 'ramcrest/match'
require 'ramcrest/is'

module Ramcrest
  module HasSize
  module_function
    def has_size(expected)
      Matcher.new(Ramcrest::Is.to_matcher(expected))
    end

    class Matcher
      include Ramcrest::Match

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        match = @expected.matches?(actual.size)
        if match.matched?
          success
        else
          mismatch("size #{match.description}")
        end
      end

      def description
        "an enumerable of size #{@expected.description}"
      end
    end
  end
end

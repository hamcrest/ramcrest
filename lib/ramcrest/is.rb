require 'ramcrest/match'

module Ramcrest
  module Is
  module_function

    def is(expected)
      IsMatcher.new(Ramcrest::EqualTo.to_matcher(expected))
    end

    class IsMatcher
      include Ramcrest::Match

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        match = @expected.matches?(actual)
        if match.matched?
          success
        else
          mismatch("was <#{match.description}>")
        end
      end

      def description
        "is <#{@expected.description}>"
      end
    end
  end
end

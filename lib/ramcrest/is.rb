require 'ramcrest/match'

module Ramcrest
  module Is
    def is(expected)
      IsMatcher.new(expected)
    end

    class IsMatcher
      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        if @expected == actual
          Ramcrest::Match.success
        else
          Ramcrest::Match.mismatch("was <#{actual}>")
        end
      end

      def description
        "is <#{@expected}>"
      end
    end
  end
end

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
          success
        else
          mismatch("was <#{actual}>")
        end
      end

      def description
        "is <#{@expected}>"
      end

      include Ramcrest::Match
    end
  end
end

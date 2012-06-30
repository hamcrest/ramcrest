require 'ramcrest/match'

module Ramcrest
  module Is
    def self.to_matcher(possible_matcher)
      return possible_matcher if Ramcrest.is_matcher?(possible_matcher)
      Ramcrest::Is.is(possible_matcher)
    end

  module_function

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

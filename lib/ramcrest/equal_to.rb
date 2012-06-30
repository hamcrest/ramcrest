require 'ramcrest/match'

module Ramcrest
  module EqualTo
    def self.to_matcher(possible_matcher)
      return possible_matcher if Ramcrest.is_matcher?(possible_matcher)
      Ramcrest::EqualTo.equal_to(possible_matcher)
    end

  module_function

    def equal_to(expected)
      EqualToMatcher.new(expected)
    end

    class EqualToMatcher
      include Ramcrest::Match

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        if @expected == actual
          success
        else
          mismatch("#{actual}")
        end
      end

      def description
        "#{@expected}"
      end
    end
  end
end

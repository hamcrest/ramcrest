require 'ramcrest/match'

module Ramcrest
  module IncludesInAnyOrderExactly
  module_function

    def includes_in_any_order_exactly(*expected)
      expected_matchers = expected.collect(&Ramcrest::EqualTo.method(:to_matcher))
      IncludesInAnyOrderExactlyMatcher.new(expected_matchers)
    end

    class IncludesInAnyOrderExactlyMatcher
      include Ramcrest::Match

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        if actual.size != @expected.size
          mismatch("an enumerable of [#{actual.join(', ')}] which is the wrong size")
        elsif all_match_expected?(actual)
          success
        else
          mismatch("an enumerable of [#{actual.join(', ')}]")
        end
      end

      def description
        descriptions_of_expecteds = @expected.collect(&:description)
        "an enumerable including in any order exactly [#{descriptions_of_expecteds.join(', ')}]"
      end

    private

      def all_match_expected?(actual)
        unmatched_expectations_from(actual).empty?
      end

      def unmatched_expectations_from(actual)
        actual.inject(@expected) do |left_to_expect, value|
          matched = left_to_expect.find { |expect| expect.matches?(value).matched? }
          left_to_expect.reject { |expect| expect == matched }
        end
      end
    end
  end
end

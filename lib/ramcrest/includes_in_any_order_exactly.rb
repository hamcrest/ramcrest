require 'ramcrest/base_enumerable_matcher'

module Ramcrest
  module IncludesInAnyOrderExactly
  module_function

    def includes_in_any_order_exactly(*expected)
      expected_matchers = expected.collect(&Ramcrest::EqualTo.method(:to_matcher))
      Matcher.new(expected_matchers)
    end

    class Matcher < Ramcrest::Enumerable::BaseEnumerableMatcher
      def initialize(expected)
        super("including in any order exactly", expected)
      end

    protected

      def unmatched_expectations_from(actual)
        actual.inject(@expected) do |left_to_expect, value|
          matched = matcher_that_matches(value, left_to_expect)
          no_longer_expect(matched, left_to_expect)
        end
      end

      def matcher_that_matches(value, expected)
        expected.find { |expect| expect.matches?(value).matched? }
      end

      def no_longer_expect(matched, expected)
        expected.reject { |expect| expect == matched }
      end
    end
  end
end

require 'ramcrest/base_enumerable_matcher'

module Ramcrest
  module Includes
  module_function

    def includes(*expected)
      expected_matchers = expected.collect(&Ramcrest::EqualTo.method(:to_matcher))
      Matcher.new(expected_matchers)
    end

    class Matcher < Ramcrest::Enumerable::BaseEnumerableMatcher
      include Ramcrest::Match

      def initialize(expected)
        super("including",
              expected,
              Ramcrest::Comparable.greater_or_equal_to(expected.size))
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

require 'ramcrest/base_enumerable_matcher'

module Ramcrest
  module IncludesExactly
  module_function

    def includes_exactly(*expected)
      expected_matchers = expected.collect(&Ramcrest::EqualTo.method(:to_matcher))
      Matcher.new(expected_matchers)
    end

    class Matcher < Ramcrest::Enumerable::BaseEnumerableMatcher
      def initialize(expected)
        super("including exactly",
              expected,
              Ramcrest::EqualTo.equal_to(expected.size))
      end

    protected

      def unmatched_expectations_from(actual)
        unmatched = actual.zip(@expected).drop_while do |pair|
          pair[1].matches?(pair[0]).matched?
        end
        unmatched.collect { |pair| pair[1] }
      end
    end
  end
end

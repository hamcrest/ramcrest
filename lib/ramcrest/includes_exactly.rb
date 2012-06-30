require 'ramcrest/match'

module Ramcrest
  module IncludesExactly
  module_function

    def includes_exactly(*expected)
      expected_matchers = expected.collect(&Ramcrest::EqualTo.method(:to_matcher))
      IncludesExactlyMatcher.new(expected_matchers)
    end

    class IncludesExactlyMatcher
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
        "an enumerable including exactly [#{descriptions_of_expecteds.join(', ')}]"
      end

    private

      def all_match_expected?(actual)
        actual.zip(@expected).all? { |pair| pair[1].matches?(pair[0]).matched? }
      end
    end
  end
end

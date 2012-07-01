require 'ramcrest/match'

module Ramcrest
  module Enumerable
    class BaseEnumerableMatcher
      include Ramcrest::Match

      def initialize(match_type_description, expected, size_matcher)
        @match_type_description = match_type_description
        @expected = expected
        @size_matcher = Ramcrest::HasSize.has_size(size_matcher)
      end

      def matches?(actual)
        size_match = @size_matcher.matches?(actual)
        if !size_match.matched?
          return mismatch("an enumerable of #{size_match.description}. Enumerable was #{show(actual)}.")
        end

        unmatched = unmatched_expectations_from(actual)
        if unmatched.empty?
          success
        else
          mismatch("an enumerable that does not include #{describe(unmatched)}. Enumerable was #{show(actual)}.")
        end
      end

      def description
        "an enumerable #{@match_type_description} #{description_of_expecteds}"
      end

    private

      def show(array)
        "[#{array.join(', ')}]"
      end

      def description_of_expecteds
        describe(@expected)
      end

      def describe(matchers)
        show(matchers.collect(&:description))
      end
    end
  end
end

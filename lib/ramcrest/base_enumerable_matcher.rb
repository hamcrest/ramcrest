require 'ramcrest/match'

module Ramcrest
  module Enumerable
    class BaseEnumerableMatcher
      include Ramcrest::Match

      def initialize(match_type_description, expected)
        @match_type_description = match_type_description
        @expected = expected
      end

      def matches?(actual)
        if actual.size != @expected.size
          return mismatch("an enumerable of [#{actual.join(', ')}] which is the wrong size")
        end

        unmatched = unmatched_expectations_from(actual)
        if unmatched.empty?
          success
        else
          mismatch("an enumerable that does not include #{describe(unmatched)}. Enumerable included [#{actual.join(', ')}]")
        end
      end

      def description
        "an enumerable #{@match_type_description} #{description_of_expecteds}"
      end

    private

      def description_of_expecteds
        describe(@expected)
      end

      def describe(matchers)
        "[#{matchers.collect(&:description).join(', ')}]"
      end
    end
  end
end

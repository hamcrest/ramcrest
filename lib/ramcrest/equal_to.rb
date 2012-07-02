require 'ramcrest/matcher'

module Ramcrest
  module EqualTo
    def self.to_matcher(possible_matcher)
      return possible_matcher if Ramcrest.is_matcher?(possible_matcher)
      Ramcrest::EqualTo.equal_to(possible_matcher)
    end

  module_function

    def equal_to(expected)
      Matcher.new(expected)
    end

    class Matcher
      include Ramcrest::Matcher

      def initialize(expected)
        @expected = expected
      end

      def do_match(expected, actual)
        MatchResult.new(expected == actual)
      end

      def mismatch_message(actual, match)
        "#{actual}"
      end

      def description
        "#{@expected}"
      end
    end
  end
end

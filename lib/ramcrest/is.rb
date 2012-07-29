require 'ramcrest/matcher'

module Ramcrest
  module Is
    def self.to_matcher(possible_matcher)
      return possible_matcher if Ramcrest.is_matcher?(possible_matcher)
      Ramcrest::Is.is(possible_matcher)
    end

  module_function

    def is(expected)
      Matcher.new(Ramcrest::EqualTo.to_matcher(expected), Ramcrest.is_matcher?(expected))
    end

    class Matcher
      include Ramcrest::Matcher

      def initialize(expected, was_originally_matcher)
        @expected = expected
        @was_originally_matcher = was_originally_matcher
      end

      def mismatch_message(actual, match)
        "was #{show match.description}"
      end

      def description
        "is #{show @expected.description}"
      end

    private

      def show(text)
        if @was_originally_matcher
          text
        else
          "<#{text}>"
        end
      end
    end
  end
end

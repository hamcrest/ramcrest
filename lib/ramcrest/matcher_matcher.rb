require 'ramcrest/match'

module Ramcrest
  module MatcherMatcher
    def a_matcher_that_matches(value)
      MatcherThatMatchesMatcher.new(value)
    end

    def a_matcher_described_as(description)
      MatcherDescribedAsMatcher.new(description)
    end

    def a_matcher_that_mismatches(value, description)
      MatcherThatMismatchesMatcher.new(value, description)
    end

    class MatcherThatMatchesMatcher
      include Ramcrest::Match

      def initialize(value)
        @value = value
      end

      def matches?(matcher)
        match = matcher.matches?(@value)
        if match.matched?
          success
        else
          mismatch("a matcher describing itself as <#{matcher.description}> that mismatched with <#{match.description}>")
        end
      end

      def description
        "a matcher that matches <#{@value}>"
      end
    end

    class MatcherDescribedAsMatcher
      include Ramcrest::Match

      def initialize(description)
        @description = description
      end

      def matches?(matcher)
        if matcher.description == @description
          success
        else
          mismatch("a matcher that described itself as \"#{matcher.description}\"")
        end
      end

      def description
        "a matcher described as \"#{@description}\""
      end
    end

    class MatcherThatMismatchesMatcher
      include Ramcrest::Match

      def initialize(value, description)
        @value = value
        @description = description
      end

      def matches?(matcher)
        match = matcher.matches?(@value)
        if match.matched?
          mismatch("the matcher matched")
        else
          if match.description == @description
            success
          else
            mismatch("the mismatch description was \"#{match.description}\"")
          end
        end
      end

      def description
        "a matcher that mismatches <#{@value}> explained by \"#{@description}\""
      end
    end
  end
end

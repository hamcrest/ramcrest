module Ramcrest
  module Matcher

    def do_match(expected, actual)
      expected.matches?(actual)
    end

    def matches?(actual)
      match = do_match(@expected, actual)
      if match.matched?
        success
      else
        mismatch(mismatch_message(actual, match))
      end
    end

    def success
      MatchResult::SUCCESS
    end

    def mismatch(description)
      MatchResult.new(false, description)
    end

    class MatchResult
      attr_reader :description

      def initialize(matched, description = nil)
        @matched = matched
        @description = description
      end

      def negate
        MatchResult.new(!@matched, @description)
      end

      def or_else(&mismatch_block)
        if matched?
          self
        else
          yield self
        end
      end

      def and_also(&continue_block)
        if matched?
          yield
        else
          self
        end
      end

      def matched?
        @matched
      end

      SUCCESS = MatchResult.new(true)
    end
  end
end

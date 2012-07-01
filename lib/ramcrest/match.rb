module Ramcrest
  module Match


    module_function

    def success
      MatchResult.new(true)
    end

    def mismatch(description)
      MatchResult.new(false, description)
    end

    class MatchResult
      attr_reader :description

      def initialize(matched, description = nil)
        @matched = matched
        @description = description
        @negated = false
      end

      def negate!
        @negated = true
        self
      end

      def matched?
        @negated ? !@matched : @matched
      end
    end
  end
end

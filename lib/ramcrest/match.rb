module Ramcrest
  module Match
    module_function

    def success
      MatchResult.new(true, nil)
    end

    def mismatch(description) 
      MatchResult.new(false, description)
    end

    class MatchResult
      attr_reader :description

      def initialize(matched, description)
        @matched = matched
        @description = description
      end

      def matched?
        @matched
      end
    end
  end
end

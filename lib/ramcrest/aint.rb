require 'ramcrest/match'

module Ramcrest
  module Aint
  module_function
    def aint(matcher)
      Matcher.new(Ramcrest::EqualTo.to_matcher(matcher))
    end

    class Matcher
      include Ramcrest::Match

      def initialize(matcher)
        @matcher = matcher
      end

      def matches?(actual)
        match = @matcher.matches?(actual)
        if match.matched?
          mismatch("<#{actual}>")
        else
          success
        end
      end

      def description
        "not #{@matcher.description}"
      end
    end
  end
end

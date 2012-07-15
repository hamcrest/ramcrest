module RSpec
  module Expectations
    class ExpectationTarget
      def that(matcher)
        match = matcher.matches?(@target)
        if not match.matched?
          ::RSpec::Expectations.fail_with("expected: #{matcher.description}\nbut: #{match.description}")
        end
      end
    end
  end
end


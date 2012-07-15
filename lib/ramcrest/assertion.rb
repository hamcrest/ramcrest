module Ramcrest
  module Assertion
    def self.assert_match(actual, matcher, &failure_handler)
      match = matcher.matches?(actual)
      if not match.matched?
        failure_handler.call("expected: #{matcher.description}\nbut: #{match.description}")
      end
    end
  end
end

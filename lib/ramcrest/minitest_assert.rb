module MiniTest
  module Assertions
    def assert_that(object, matcher)
      match = matcher.matches?(object)
      assert match.matched?, "expected: #{matcher.description}\nbut: #{match.description}"
    end
  end
end

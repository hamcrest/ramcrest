require 'ramcrest/assertion'

module MiniTest
  module Assertions
    def assert_that(object, matcher)
      Ramcrest::Assertion.assert_match(object, matcher) do |description|
        assert false, description
      end
    end
  end
end

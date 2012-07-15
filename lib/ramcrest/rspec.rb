require 'ramcrest/assertion'

module RSpec
  module Expectations
    class ExpectationTarget
      def that(matcher)
        Ramcrest::Assertion.assert_match(@target, matcher) do |description|
          ::RSpec::Expectations.fail_with(description)
        end
      end
    end
  end
end


require 'ramcrest/matcher'

module Ramcrest
  module Anything
    module_function

    def anything
      Matcher.new
    end

    class Matcher
      include Ramcrest::Matcher

      def matches?(actual)
        success
      end

      def description
        "anything"
      end
    end
  end
end

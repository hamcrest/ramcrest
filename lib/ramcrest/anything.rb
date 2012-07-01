require 'ramcrest/match'

module Ramcrest
  module Anything
    module_function

    def anything
      Matcher.new
    end

    class Matcher
      include Ramcrest::Match

      def matches?(actual)
        success
      end

      def description
        "anything"
      end
    end
  end
end

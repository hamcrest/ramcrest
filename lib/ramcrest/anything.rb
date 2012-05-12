module Ramcrest
  module Anything
    def anything
      AnythingMatcher.new
    end

    class AnythingMatcher
      def matches?(actual)
        true
      end

      def describe
        "anything"
      end
    end
  end
end

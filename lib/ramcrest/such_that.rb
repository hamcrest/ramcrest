require 'ramcrest/match'

module Ramcrest
  module SuchThat
  module_function

    def such_that(description = "<anonymous>", &matcher_block)
      SuchThatMatcher.new(description, matcher_block)
    end

    class SuchThatMatcher
      include Ramcrest::Match

      def initialize(description, matcher_block)
        self.class.send(:define_method, :matches?, matcher_block)
        @description = description
      end

      def description
        "such that #{@description}"
      end
    end
  end
end

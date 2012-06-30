require 'ramcrest/match'

module Ramcrest
  module SuchThat
  module_function

    def such_that(description = "<anonymous>", &matcher_block)
      Matcher.new(description, matcher_block)
    end

    class Matcher
      include Ramcrest::Match

      def initialize(description, matcher_block)
        singleton = class << self; self; end
        singleton.send(:define_method, :matches?, matcher_block)
        @description = description
      end

      def description
        "such that #{@description}"
      end
    end
  end
end

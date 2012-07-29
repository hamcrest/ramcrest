require 'ramcrest/matcher'

module Ramcrest
  module SuchThat
  module_function

    def such_that(description = "<anonymous such_that>", &matcher_block)
      Matcher.new(description, matcher_block)
    end

    class Matcher
      include Ramcrest::Matcher

      attr_reader :description

      def initialize(description, matcher_block)
        singleton = class << self; self; end
        singleton.send(:define_method, :matches?, matcher_block)
        @description = description
      end
    end
  end
end

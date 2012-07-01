require 'ramcrest/match'

module Ramcrest
  module Comparable
  module_function

    def greater_than(expected)
      Matcher.new("greater than", :>, expected)
    end

    def greater_or_equal_to(expected)
      Matcher.new("greater than or equal to", :>=, expected)
    end

    def less_than(expected)
      Matcher.new("less than", :<, expected)
    end

    def less_or_equal_to(expected)
      Matcher.new("less than or equal to", :<=, expected)
    end

    class Matcher
      include Ramcrest::Match

      def initialize(name, operator, expected)
        @name = name
        @operator = operator
        @expected = expected
      end

      def matches?(actual)
        if actual.send(@operator, @expected)
          success
        else
          mismatch("was <#{actual}>")
        end
      end

      def description
        "#{@name} <#{@expected}>"
      end
    end
  end
end

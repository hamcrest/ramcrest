require 'ramcrest/match'
require 'ramcrest/anything'

module Ramcrest
  module HasAttribute
    module_function

    def has_attribute(attribute_name, value_matcher = Ramcrest::Anything.anything())
      Matcher.new(attribute_name, value_matcher)
    end

    class Matcher
      def initialize(attribute_name, value_matcher)
        @attribute_name = attribute_name
        @value_matcher = value_matcher
      end

      def matches?(actual)
        if actual.respond_to?(@attribute_name)
          match = @value_matcher.matches?(actual.send(@attribute_name))
          if match.matched?
            return success
          else
            return mismatch("object <#{actual}> attribute '#{@attribute_name}' #{match.description}")
          end
        else
          return mismatch("object <#{actual}> was missing attribute '#{@attribute_name}'")
        end
      end

      def description
        "an object with an attribute named '#{@attribute_name}' and value #{@value_matcher.description}"
      end

      include Ramcrest::Match
    end
  end
end

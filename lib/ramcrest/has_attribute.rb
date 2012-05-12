require 'ramcrest/match'

module Ramcrest
  module HasAttribute
    def has_attribute(attribute_name)
      HasAttribute.new(attribute_name)
    end

    class HasAttribute
      def initialize(attribute_name)
        @attribute_name = attribute_name
      end

      def matches?(actual)
        if actual.respond_to?(@attribute_name)
          return Ramcrest::Match.success
        else 
          return Ramcrest::Match.mismatched("object <#{actual}> was missing attribute '#{@attribute_name}'")
        end
      end

      def description
        "an object with an attribute named '#{@attribute_name}'"
      end
    end
  end
end

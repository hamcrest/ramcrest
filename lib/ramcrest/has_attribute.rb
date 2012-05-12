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
        actual.respond_to?(@attribute_name)
      end

      def describe
        "an object with an attribute named '#{@attribute_name}'"
      end
    end
  end
end

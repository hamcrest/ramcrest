require 'minitest/autorun'
require 'ramcrest/has_attribute'

describe Ramcrest::HasAttribute do
  include Ramcrest::HasAttribute

  describe "when not matching the value" do
    it "matches an object with the attribute" do
      obj = an_object_with_attribute(:foo)

      has_attribute(:foo).matches?(obj).matched?.must_equal true
    end

    it "does not match an object that does not have the attribute" do
      obj = an_object_with_attribute(:different)

      has_attribute(:foo).matches?(obj).matched?.must_equal false
    end

    it "describes why it does not match an object that is missing the attribute" do
      obj = an_object_with_attribute(:different)

      has_attribute(:foo).matches?(obj).description.must_equal "object <#{obj}> was missing attribute 'foo'"
    end

    it "describes itself" do
      has_attribute(:foo).description.must_equal "an object with an attribute named 'foo'"
    end
  end

  def an_object_with_attribute(name)
    obj_with_attr = Object.new
    obj_with_attr.define_singleton_method(name) {}
    obj_with_attr
  end
end

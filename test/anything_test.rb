require 'minitest/autorun'
require 'ramcrest/has_attribute'

describe Ramcrest::HasAttribute do
  include Ramcrest::HasAttribute

  describe "when not matching the value" do
    it "matches an object with the attribute" do
      obj = an_object_with_attribute(:foo)

      has_attribute(:foo).matches?(obj).must_equal true
    end

    it "does not match an object that does not have the attribute" do
      obj = an_object_with_attribute(:different)

      has_attribute(:foo).matches?(obj).must_equal false
    end

    it "describes itself" do
      has_attribute(:foo).describe.must_equal "an object with an attribute named 'foo'"
    end
  end

  def an_object_with_attribute(name)
    obj_with_attr = Object.new
    obj_with_attr.define_singleton_method(name) {}
    obj_with_attr
  end
end

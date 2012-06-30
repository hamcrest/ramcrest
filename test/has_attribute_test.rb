require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::HasAttribute do
  include Ramcrest::HasAttribute
  include Ramcrest::Is

  describe "when not matching the value" do
    it "matches an object with the attribute" do
      obj = an_object_with_attribute(:foo)

      has_attribute(:foo).matches?(obj).
        matched?.must_equal true
    end

    it "does not match an object that does not have the attribute" do
      obj = an_object_with_attribute(:different)

      has_attribute(:foo).matches?(obj).
        matched?.must_equal false
    end

    it "describes why it does not match an object that is missing the attribute" do
      obj = an_object_with_attribute(:different)

      has_attribute(:foo).matches?(obj).
        description.must_equal "object <#{obj}> was missing attribute 'foo'"
    end

    it "describes itself" do
      has_attribute(:foo).
        description.must_equal "an object with an attribute named 'foo' and value anything"
    end
  end

  describe "when matching the value" do
    it "matches an object with the attribute and the value" do
      obj = an_object_with_attribute(:foo, 1)

      has_attribute(:foo, is(1)).matches?(obj).
        matched?.must_equal true
    end

    it "does not match an object that does not have the attribute" do
      obj = an_object_with_attribute(:different)

      has_attribute(:foo, is(1)).matches?(obj).
        matched?.must_equal false
    end

    it "does not match an object that has a different value" do
      obj = an_object_with_attribute(:foo, 2)

      has_attribute(:foo, is(1)).matches?(obj).
        matched?.must_equal false
    end

    it "describes why it does not match an object that is missing the attribute" do
      obj = an_object_with_attribute(:different)

      has_attribute(:foo, is(1)).matches?(obj).
        description.must_equal "object <#{obj}> was missing attribute 'foo'"
    end

    it "describes itself" do
      has_attribute(:foo, is(1)).
        description.must_equal "an object with an attribute named 'foo' and value is <1>"
    end
  end

  def an_object_with_attribute(name, value = nil)
    obj_with_attr = Object.new
    obj_with_attr.define_singleton_method(name) { value }
    obj_with_attr
  end
end

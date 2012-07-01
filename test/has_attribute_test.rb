require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::HasAttribute do
  include Ramcrest::MatcherMatcher
  include Ramcrest::HasAttribute
  include Ramcrest::Is

  describe "when not matching the value" do
    it "matches an object with the attribute" do
      obj = an_object_with_attribute(:foo)

      assert_that has_attribute(:foo), a_matcher_that_matches(obj)
    end

    it "does not match an object that does not have the attribute" do
      obj = an_object_with_attribute(:different)

      assert_that has_attribute(:foo),
        a_matcher_that_mismatches(obj, "object <#{obj}> was missing attribute 'foo'")
    end

    it "describes itself" do
      assert_that has_attribute(:foo),
        a_matcher_described_as("an object with an attribute named 'foo' and value anything")
    end
  end

  describe "when matching the value" do
    it "matches an object with the attribute and the value" do
      obj = an_object_with_attribute(:foo, 1)

      assert_that has_attribute(:foo, is(1)), a_matcher_that_matches(obj)
    end

    it "does not match an object that does not have the attribute" do
      obj = an_object_with_attribute(:different)

      assert_that has_attribute(:foo, is(1)),
        a_matcher_that_mismatches(obj, "object <#{obj}> was missing attribute 'foo'")
    end

    it "does not match an object that has a different value" do
      obj = an_object_with_attribute(:foo, 2)

      assert_that has_attribute(:foo, is(1)),
        a_matcher_that_mismatches(obj, "object <#{obj}> attribute 'foo' was <2>")
    end

    it "describes itself" do
      assert_that has_attribute(:foo, is(1)),
        a_matcher_described_as("an object with an attribute named 'foo' and value is <1>")
    end
  end

  def an_object_with_attribute(name, value = nil)
    Struct.new(name).new(value)
  end
end

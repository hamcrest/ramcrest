require 'minitest/autorun'
require 'ramcrest/matcher'

describe Ramcrest::Matcher do
  include Ramcrest::Matcher

  it "a successful match is equivalent to true" do
    assert_equal true, success.matched?
  end

  it "an unsuccessful match is equivalent to false" do
    assert_equal false, mismatch("description").matched?
  end

  it "an unsuccessful match has a description" do
    assert_equal "description", mismatch("description").description
  end

  it "a successful match has no description" do
    assert_nil success.description
  end

  describe "#negate" do
    it "inverts the result" do
      assert_equal false, success.negate.matched?
      assert_equal true, mismatch("description").negate.matched?
    end
  end
end

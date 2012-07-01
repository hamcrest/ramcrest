require 'minitest/autorun'
require 'ramcrest/match'

describe Ramcrest::Match do
  include Ramcrest::Match

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
end

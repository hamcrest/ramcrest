require 'minitest/autorun'
require 'ramcrest/match'

describe Ramcrest::Match do
  it "a successful match is equivalent to true" do
    Ramcrest::Match.success.matched?.must_equal true
  end

  it "an unsuccessful match is equivalent to false" do
    Ramcrest::Match.mismatch("description").matched?.must_equal false
  end

  it "an unsuccessful match has a description" do
    Ramcrest::Match.mismatch("description").description.must_equal "description"
  end

  it "a successful match has no description" do
    Ramcrest::Match.success.description.must_be_nil
  end
end

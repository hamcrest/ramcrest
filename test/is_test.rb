require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::Is do
  include Ramcrest::Is

  it "matches objects that are the same" do
    is(1).matches?(1).matched?.must_equal true
  end

  it "does not match objects that are different" do
    is(1).matches?(2).matched?.must_equal false
  end

  it "describes the object that was seen when it mismatches" do
    is(1).matches?(2).description.must_equal "was <2>" 
  end

  it "describes itself" do
    is(1).description.must_equal "is <1>" 
  end
end

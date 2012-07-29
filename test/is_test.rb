require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::Is do
  include Ramcrest::MatcherMatcher
  include Ramcrest::Is

  it "matches objects that are the same" do
    assert_that is(1), a_matcher_that_matches(1)
  end

  it "matches using other matchers" do
    assert_that is(is(1)), a_matcher_that_matches(1)
  end

  it "does not match objects that are different" do
    assert_that is(1), a_matcher_that_mismatches(2, "was <2>")
  end

  it "describes itself" do
    assert_that is(1), a_matcher_described_as("is <1>")
  end

  describe "when composed with another matcher" do
    it "describes itself without extra marks" do
      assert_that is(is(1)), a_matcher_described_as("is is <1>")
    end

    it "does not describe a mismatch with extra marks" do
      assert_that is(is(1)), a_matcher_that_mismatches(2, "was was <2>")
    end
  end
end

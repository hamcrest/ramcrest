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
end

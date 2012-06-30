require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::Aint do
  include Ramcrest::Aint
  include Ramcrest::Is
  include Ramcrest::MatcherMatcher

  it "matches objects that are the different" do
    assert_that aint(is(1)), a_matcher_that_matches(2)
  end

  it "coerces values into an is() matcher" do
    assert_that aint(1), a_matcher_that_matches(2)
  end

  it "matches objects that are the different" do
    assert_that aint(is(1)), a_matcher_described_as("not is <1>")
  end

  it "does not match objects that are the same" do
    assert_that aint(is(1)), a_matcher_that_mismatches(1, "<1>")
  end
end

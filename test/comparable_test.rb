require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::Comparable do
  include Ramcrest::MatcherMatcher
  include Ramcrest::Comparable

  it "matches greater than" do
    assert_that greater_than(1), a_matcher_that_matches(2)
    assert_that greater_than(1), a_matcher_that_mismatches(1, "was <1>")
    assert_that greater_than(1), a_matcher_described_as("greater than <1>")
  end

  it "matches less than" do
    assert_that less_than(1), a_matcher_that_matches(0)
    assert_that less_than(1), a_matcher_that_mismatches(1, "was <1>")
    assert_that less_than(1), a_matcher_described_as("less than <1>")
  end

  it "matches greater than or equal" do
    assert_that greater_or_equal_to(1), a_matcher_that_matches(2)
    assert_that greater_or_equal_to(1), a_matcher_that_matches(1)
    assert_that greater_or_equal_to(1), a_matcher_that_mismatches(0, "was <0>")
    assert_that greater_or_equal_to(1), a_matcher_described_as("greater than or equal to <1>")
  end

  it "matches less than or equal" do
    assert_that less_or_equal_to(1), a_matcher_that_matches(0)
    assert_that less_or_equal_to(1), a_matcher_that_matches(1)
    assert_that less_or_equal_to(1), a_matcher_that_mismatches(2, "was <2>")
    assert_that less_or_equal_to(1), a_matcher_described_as("less than or equal to <1>")
  end
end

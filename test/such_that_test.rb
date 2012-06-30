require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::SuchThat do
  include Ramcrest::MatcherMatcher
  include Ramcrest::SuchThat

  it "matches when the such that block returns success" do
    assert_that such_that { |value| success }, a_matcher_that_matches(nil)
  end

  it "mismatches when the such that block returns mismatch" do
    assert_that such_that { |value| mismatch("wrong") }, a_matcher_that_mismatches(nil, "wrong")
  end

  it "describes itself by default as an anonymous matcher" do
    assert_that such_that { |value| }, a_matcher_described_as("such that <anonymous>")
  end

  it "can have a description provided" do
    assert_that such_that("something is true") { |value| },
      a_matcher_described_as("such that something is true")
  end
end

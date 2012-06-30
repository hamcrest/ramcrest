require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::Anything do
  include Ramcrest::MatcherMatcher
  include Ramcrest::Anything

  it "always matches" do
    assert_that anything(), a_matcher_that_matches(nil)
    assert_that anything(), a_matcher_that_matches({})
  end

  it "describes itself" do
    assert_that anything(), a_matcher_described_as("anything")
  end
end


require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::HasSize do
  include Ramcrest::MatcherMatcher
  include Ramcrest::Is
  include Ramcrest::HasSize

  it "matches objects with a matching size" do
    assert_that has_size(1), a_matcher_that_matches([1])
    assert_that has_size(1), a_matcher_that_matches({ :a => 1 })
  end

  it "matches using other matchers" do
    assert_that has_size(Ramcrest::SuchThat.such_that { |size| success }),
      a_matcher_that_matches([2, 3])
  end

  it "does not match objects that are different size" do
    assert_that has_size(1), a_matcher_that_mismatches([1, 2], "size was <2>")
  end

  it "describes itself" do
    assert_that has_size(1), a_matcher_described_as("an enumerable of size is <1>")
  end
end

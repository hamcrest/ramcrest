require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::IncludesExactly do
  include Ramcrest::MatcherMatcher
  include Ramcrest::Is
  include Ramcrest::IncludesExactly

  it "matches enumerables that have all of the elements in order" do
    assert_that includes_exactly(is(1), is(2)), a_matcher_that_matches([1, 2])
  end

  it "coerces values into equality matches" do
    assert_that includes_exactly(1, 2), a_matcher_that_matches([1, 2])
  end

  it "does not match when the elements are out of order" do
    assert_that includes_exactly(is(1), is(2)),
      a_matcher_that_mismatches([2, 1], "an enumerable that does not include [is <1>, is <2>]. Enumerable was [2, 1].")
  end

  it "does not match when there is an unexpected element" do
    assert_that includes_exactly(is(1), is(2)),
      a_matcher_that_mismatches([1, 3], "an enumerable that does not include [is <2>]. Enumerable was [1, 3].")
  end

  it "does not match when there are fewer elements than expected" do
    assert_that includes_exactly(is(1), is(2)),
      a_matcher_that_mismatches([1], "an enumerable of size 1. Enumerable was [1].")
  end

  it "does not match when there are more elements than expected" do
    assert_that includes_exactly(is(1), is(2)),
      a_matcher_that_mismatches([1, 2, 3], "an enumerable of size 3. Enumerable was [1, 2, 3].")
  end

  it "describes itself" do
    assert_that includes_exactly(is(1), is(2)),
      a_matcher_described_as("an enumerable including exactly [is <1>, is <2>]")
  end
end

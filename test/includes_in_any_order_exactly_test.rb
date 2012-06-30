require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::IncludesInAnyOrderExactly do
  include Ramcrest::MatcherMatcher
  include Ramcrest::Is
  include Ramcrest::IncludesInAnyOrderExactly

  it "matches enumerables that have all of the elements" do
    assert_that includes_in_any_order_exactly(is(1), is(2)), a_matcher_that_matches([2, 1])
  end

  it "coerces values into equality matches" do
    assert_that includes_in_any_order_exactly(1, 2), a_matcher_that_matches([2, 1])
  end

  it "does not match when there is an unexpected element" do
    assert_that includes_in_any_order_exactly(is(1), is(2)),
      a_matcher_that_mismatches([1, 3], "an enumerable that does not include [is <2>]. Enumerable included [1, 3]")
  end

  it "does not match when there are fewer elements than expected" do
    assert_that includes_in_any_order_exactly(is(1), is(2)),
      a_matcher_that_mismatches([1], "an enumerable of [1] which is the wrong size")
  end

  it "does not match when there are more elements than expected" do
    assert_that includes_in_any_order_exactly(is(1), is(2)),
      a_matcher_that_mismatches([1, 2, 3], "an enumerable of [1, 2, 3] which is the wrong size")
  end

  it "describes itself" do
    assert_that includes_in_any_order_exactly(is(1), is(2)),
      a_matcher_described_as("an enumerable including in any order exactly [is <1>, is <2>]")
  end
end

require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::Includes do
  include Ramcrest::MatcherMatcher
  include Ramcrest::Is
  include Ramcrest::Includes

  it "matches enumerables that have all of the elements" do
    assert_that includes(is(1), is(2)), a_matcher_that_matches([1, 3, 2])
  end

  it "coerces values into equality matches" do
    assert_that includes(1, 2), a_matcher_that_matches([1, 3, 2])
  end

  it "does not match when there is an unexpected element" do
    assert_that includes(is(1), is(2)),
      a_matcher_that_mismatches([1, 3], "an enumerable that does not include [is <2>]. Enumerable was [1, 3].")
  end

  it "does not match when there are fewer elements than expected" do
    assert_that includes(is(1), is(2)),
      a_matcher_that_mismatches([1], "an enumerable of size was <1>. Enumerable was [1].")
  end

  it "describes itself" do
    assert_that includes(is(1), is(2)),
      a_matcher_described_as("an enumerable including [is <1>, is <2>]")
  end
end

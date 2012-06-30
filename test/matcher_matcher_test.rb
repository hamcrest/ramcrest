require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::MatcherMatcher do
  include Ramcrest::MatcherMatcher

  INCORRECT_VALUE = 2
  INCORRECT_DESCRIPTION = "wrong description"
  CORRECT_VALUE = 1

  MATCHER = Ramcrest::Is.is(CORRECT_VALUE)
  MATCHER_DESCRIPTION = MATCHER.description
  MISMATCH_DESCRIPTION = MATCHER.matches?(INCORRECT_VALUE).description

  describe "#a_matcher_that_matches" do
    it "matches when the tested matcher matches" do
      assert_that MATCHER, a_matcher_that_matches(CORRECT_VALUE)
    end

    it "mismatches when the tested matcher does not match" do
      match = a_matcher_that_matches(INCORRECT_VALUE).matches?(MATCHER)

      assert !match.matched?
    end

    it "describes itself" do
      assert_equal "a matcher that matches <#{CORRECT_VALUE}>", a_matcher_that_matches(CORRECT_VALUE).description
    end

    it "describes the mismatch when the matcher does not match" do
      assert_equal "a matcher describing itself as <#{MATCHER_DESCRIPTION}> that mismatched with <#{MISMATCH_DESCRIPTION}>", a_matcher_that_matches(INCORRECT_VALUE).matches?(MATCHER).description
    end
  end

  describe "#a_matcher_described_as" do
    it "matches when the matcher's description matches" do
      assert_that MATCHER, a_matcher_described_as(MATCHER_DESCRIPTION)
    end

    it "mismatches when the matcher's description does not match" do
      match = a_matcher_described_as(INCORRECT_DESCRIPTION).matches?(MATCHER)

      assert !match.matched?
    end

    it "describes itself" do
      assert_equal "a matcher described as \"#{MATCHER_DESCRIPTION}\"", a_matcher_described_as(MATCHER_DESCRIPTION).description
    end

    it "describes the mismatch when the matcher does not match" do
      assert_equal "a matcher that described itself as \"#{MATCHER_DESCRIPTION}\"", a_matcher_described_as(INCORRECT_DESCRIPTION).matches?(MATCHER).description
    end
  end

  describe "#a_matcher_that_mismatches" do
    it "matches when the matcher mismatches with the wanted description" do
      assert_that MATCHER, a_matcher_that_mismatches(INCORRECT_VALUE, MISMATCH_DESCRIPTION)
    end

    it "mismatches when the matcher matches" do
      match = a_matcher_that_mismatches(CORRECT_VALUE, MISMATCH_DESCRIPTION).matches?(MATCHER)

      assert !match.matched?
      assert_equal "the matcher matched", match.description
    end

    it "mismatches when the matcher mismatched but provided the wrong mismatch description" do
      match = a_matcher_that_mismatches(INCORRECT_VALUE, "wrong mismatch desc").matches?(MATCHER)

      assert !match.matched?
      assert_equal "the mismatch description was \"#{MISMATCH_DESCRIPTION}\"", match.description
    end

    it "describes itself" do
      assert_equal "a matcher that mismatches <#{INCORRECT_VALUE}> explained by \"#{MISMATCH_DESCRIPTION}\"", a_matcher_that_mismatches(INCORRECT_VALUE, MISMATCH_DESCRIPTION).description
    end
  end
end

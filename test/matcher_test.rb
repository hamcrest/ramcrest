require 'minitest/autorun'
require 'ramcrest/matcher'

describe Ramcrest::Matcher do
  include Ramcrest::Matcher

  it "a successful match is equivalent to true" do
    assert_equal true, success.matched?
  end

  it "an unsuccessful match is equivalent to false" do
    assert_equal false, mismatch("description").matched?
  end

  it "an unsuccessful match has a description" do
    assert_equal "description", mismatch("description").description
  end

  it "a successful match has no description" do
    assert_nil success.description
  end

  describe "#negate" do
    it "inverts the result" do
      assert_equal false, success.negate.matched?
      assert_equal true, mismatch("description").negate.matched?
    end

    it "does not change the original match" do
      original = mismatch("description")

      original.negate

      assert_equal false, original.matched?
    end
  end

  describe "when results are converted with #or_else" do
    it "returns success from #or_else when it matches" do
      assert_equal true, success.or_else { raise "not reached" }.matched?
    end

    it "calls the else block when it is a mismatch" do
      assert_raises(RuntimeError, "mismatch discription from block") do
        mismatch("mismatch description").or_else do |mismatch|
          raise RuntimeError, "#{mismatch.description} from block"
        end
      end
    end
  end
  
  describe "when chained with another match result via #and_also" do
    it "propogates successful matches" do
      assert_equal true, success.and_also { success }.matched?
    end

    it "short-circuits on a mismatch" do
      assert_equal false, mismatch("stop").and_also { raise "not reached" }.matched?
    end

    it "returns the result of the also" do
      assert_equal "the second step", success.and_also { mismatch("the second step") }.description
    end
  end
end

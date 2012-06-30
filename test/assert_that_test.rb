require 'minitest/autorun'
require 'ramcrest'

describe "assert_that" do
  include Ramcrest::Is

  it "passes when the match succeeds" do
    assert_that nil, is(nil)
  end

  it "raises when the match fails" do
    assert_raises(MiniTest::Assertion) { assert_that 1, is(2) }
  end

  it "combines the mismatch description with the matchers description for the message" do
    exception = assert_raises(MiniTest::Assertion) { assert_that 1, is(2) }
    assert_equal "expected: is <2>\nbut: was <1>", exception.message
  end
end

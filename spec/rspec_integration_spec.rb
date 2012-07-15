require 'rspec/autorun'
require 'ramcrest'

describe Ramcrest do
  include Ramcrest::HasAttribute
  include Ramcrest::Aint
  include Ramcrest::EqualTo
  include Ramcrest::Is

  it "uses a #that method on #expect for integrating with RSpec" do
    expect(1).that aint(nil)
    expect(Struct.new(:dance).new(2)).that has_attribute(:dance, equal_to(2))
  end

  it "fails the test when the matcher does not match" do
    expect { expect(1).that is(nil) }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /was <1>/)
  end
end

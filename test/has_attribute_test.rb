require 'minitest/autorun'
require 'ramcrest/anything'

describe Ramcrest::Anything do
  include Ramcrest::Anything

  it "always matches" do
    anything().matches?(nil).must_equal true
  end

  it "describes itself" do
    anything().describe.must_equal "anything"
  end
end


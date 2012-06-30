require 'minitest/autorun'
require 'ramcrest'

describe Ramcrest::Anything do
  include Ramcrest::Anything

  it "always matches" do
    anything().matches?(nil).matched?.must_equal true
  end

  it "describes itself" do
    anything().description.must_equal "anything"
  end
end


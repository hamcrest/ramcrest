module Ramcrest
  require 'ramcrest/minitest_assert'
  require 'ramcrest/is'
  require 'ramcrest/aint'
  require 'ramcrest/anything'
  require 'ramcrest/has_attribute'
  require 'ramcrest/matcher_matcher'

  def self.is_matcher?(possible_matcher)
    possible_matcher.respond_to?(:matches?) && possible_matcher.respond_to?(:description)
  end
end

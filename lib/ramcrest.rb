module Ramcrest
  require 'ramcrest/minitest_assert'
  require 'ramcrest/rspec'
  require 'ramcrest/equal_to'
  require 'ramcrest/comparable'
  require 'ramcrest/is'
  require 'ramcrest/aint'
  require 'ramcrest/anything'
  require 'ramcrest/has_attribute'
  require 'ramcrest/has_size'
  require 'ramcrest/includes'
  require 'ramcrest/includes_exactly'
  require 'ramcrest/includes_in_any_order_exactly'
  require 'ramcrest/such_that'
  require 'ramcrest/matcher_matcher'

  def self.is_matcher?(possible_matcher)
    possible_matcher.respond_to?(:matches?) && possible_matcher.respond_to?(:description)
  end
end

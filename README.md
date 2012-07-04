Ramcrest: a Ruby port of Hamcrest [![Build Status](https://secure.travis-ci.org/hamcrest/ramcrest.png?branch=master)](http://travis-ci.org/hamcrest/ramcrest)
---------------------------------

Hamcrest is a powerful set of classes and functions that allow building
up complicated matching expressions. The matchers provide useful descriptions
of what they are trying to match, as well as a description of why a particular
object is not matched (a mismatch description).

The tests for the various matchers should provide great examples of usage because
each matcher is actually tested using the Ramcrest framework.

The plan is to integrate this into RSpec so that these matchers can be used in
RSpec tests. At the moment it is only integrated with MiniTest since that is
what I grabbed when I started hacking on it.

How do I use this?
------------------

In your tests you need to 

    require 'ramcrest'

which will bring in all of the base Ramcrest matchers and give you a new
`assert_that(subject, matcher)` assertion for your MiniTest tests. Once you
have loaded the matchers you can now `include` them in your tests and start
matching away!

    describe My::Funky::Class do
      include Ramcrest::HasAttribute
      include Ramcrest::IncludesExactly

      it "only knows the funky chicken by default" do
        assert_that My::Funky::Class.new, has_attribute(:dances, includes_exactly(:funky_chicken))
      end
    end

This matches an object that has an attribute (actually just a no arg method)
called `dances` where the result of calling that method is an `Enumerable` that
includes only the symbol `:funky_chicken`.

What matchers are included?
---------------------------

This is the list of current matchers. This list will grow over time and some
names might change in order to allow for integration into various testing
frameworks.

* Ramcrest::Aint - Logical negation.
    assert_that 1, aint(2)
    assert_that [2], aint(includes_exactly(1))
* Ramcrest::Anything - Everything's OK!
    assert_that "a value", anything
* Ramcrest::Comparable - Matchers for ordering comparisons.
    assert_that 1, greater_than(0)
    assert_that 2, less_than(3)
    assert_that 3, greater_or_equal_to(3)
    assert_that 4, less_or_equal_to(4)
* Ramcrest::EqualTo - Equality (via `==`).
    assert_that "my value", equal_to("my value")
* Ramcrest::HasAttribute - Object attribute matching.
    dance = Struct.new(:twist).new(2)
    assert_that dance, has_attribute(:funk) # the attribute exits
    assert_that dance, has_attribute(:funk, equal_to(2)) # the attribute exists with a value
* Ramcrest::HasSize - Collection size.
    assert_that [1, 2], has_size(2)
    assert_that { :a => 1 }, has_size(less_or_equal_to(3))
* Ramcrest::Includes - Enumerable inclusion.
    assert_that [1, 2, 3], includes(2, 3)
    assert_that [6, 7, 2], includes(6, greater_than(6))
* Ramcrest::IncludesExactly - Enumerable equality.
    assert_that [1, 2, 3], includes_exactly(1, 2, 3)
    assert_that [3, 2, 1], aint(includes_exactly(1, 2, 3))
    assert_that [1], aint(includes_exactly(1, 2))
* Ramcrest::IncludesInAnyOrderExactly - Enumerable set equality.
    assert_that [2, 1, 3], includes_in_any_order_exactly(1, 2, 3)
    assert_that [1, 3, 4], aint(includes_in_any_order_exactly(1, 3))
* Ramcrest::Is - Syntactic sugar for equality.
    assert_that 1, is(1)
    assert_that 2, is(greater_than(1))
* Ramcrest::SuchThat - Ad hoc matchers.
    assert_that "my string", such_that { |value| value =~ /string/ ? success : mismatch("didn't contain 'string'") }

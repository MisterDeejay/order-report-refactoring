require 'date'
require_relative 'validator'

# This class validates the class of the input
# object. The #valid? method tests if the string
# passed in as input matches the class of the
# object also passed in as input.
class ClassValidator < Validator

  # Stores the input arguments as instance variables
  def initialize(object, klass)
    @object = object
    @klass = klass
  end

  # Validate the class of @object
  #
  # * raises a TypeError if @klass is not a String,
  # * then @object and @klass are passed to
  # * object_matches_class? which checks for
  # * equality between @klass and @object.class
  def valid?
    unless object_matches_class?(@klass, 'String')
      raise TypeError.new('TypeError: Input class to validate with must be in '\
                          'String format')
    end

    object_matches_class?(@object, @klass)
  end
end

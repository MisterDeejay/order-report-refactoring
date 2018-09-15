require_relative 'class_validator'

# This class validates the class of a Time
# object. It is a subclass of the ClassValidator
# class and inherits the #valid? method that
# tests if the string passed in as input matches the
# class of the object also passed in as input.
# In the case of this class, the input string is
# stored in a constant named KLASS in order to
# validate Time objects correctly.
class DateValidator < ClassValidator
  KLASS = 'Time'.freeze

  # Calls the parent class constructor passing
  # the time object and KLASS constant as
  # arguments
  def initialize(time)
    super(time, KLASS)
  end
end

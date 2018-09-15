require_relative 'class_validator'

# This class validates the class of a DateTime
# object. It is a subclass of the ClassValidator
# class and inherits the #valid? method that
# tests if the string passed in as input matches the
# class of the object also passed in as input.
# In the case of this class, the input string is
# stored in a constant named KLASS in order to
# validate DateTime objects correctly.
class DateTimeValidator < ClassValidator
  KLASS = 'DateTime'.freeze

  # Calls the parent class constructor passing
  # the datetime object and KLASS constant as
  # arguments
  def initialize(datetime)
    super(datetime, KLASS)
  end
end

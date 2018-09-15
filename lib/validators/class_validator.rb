require 'date'

# This class validates the class of the input
# object. The #valid? method allows us to test
# if the string passed in as input matches the
# class of the object also passed in as input.
class ClassValidator

  # Remember the object and class used to validate
  def initialize(object, klass)
    @object = object
    @klass = klass
  end

  # Validate the class of @object
  #
  # * raises a TypeError if @klass is not a String
  # * @object and @klass are passed to valid_type?
  # * which checks for equality between @klass
  # * and @object.class
  def valid?
    unless valid_type?(@klass, 'String')
      raise TypeError.new('TypeError: Input class to validate with must be in '\
                          'String format')
    end

    valid_type?(@object, @klass)
  end

  private

  # Determine whether the input string matches
  # the input object
  #
  # * checks for equality between the object's
  # * class in string form and return true if
  # * the two are equal, returning false
  # * otherwise
  def valid_type?(object, klass)
    object.class.to_s == klass
  end
end

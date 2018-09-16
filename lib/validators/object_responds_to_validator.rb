# This class validates whether the object
# passed in as an argument responds to a
# method name also passed in as an argument
class ObjectRespondsToValidator < Validator
  def initialize(object, method)
    @object = object
    @method = method
  end

  # Validate whether @object has a method
  # named after what's stored in @method
  #
  # * Raises a TypeError if @method isn't
  # * a String or Symbol
  # * Raises an InvalidObjectError if @object
  # * doesn't respond to the a method named
  # * after what's stored in @method, otherwise
  # * it returns true
  def validate
    unless valid_method_name?
      raise TypeError.new("TypeError: Input method name must be a String or Symbol")
    end

    unless @object.respond_to?(@method)
      raise InvalidObjectError.new(@object, @method)
    end

    true
  end

  private

  # Checks whether @method is a String or Symbol
  #
  # * Returns true if @method is either a String
  # * of Symbol, otherwise returns false
  def valid_method_name?
    object_matches_class?(@method, SYMBOL_CLASS) ||
      object_matches_class?(@method, STRING_CLASS)
  end
end

class ObjectRespondsToValidator
  def initialize(object, method)
    @object = object
    @method = method
  end

  def validate
    unless valid_method_name?
      raise TypeError.new("TypeError: Input method name must be a String or Symbol")
    end

    if object_responds_to_method?
      raise InvalidObjectError.new(@object, @method)
    end

    true
  end

  private

  def object_responds_to_method?
    @object.nil? || !@object.respond_to?(@method)
  end

  def valid_method_name?
    @method.is_a?(Symbol) || @method.is_a?(String)
  end
end

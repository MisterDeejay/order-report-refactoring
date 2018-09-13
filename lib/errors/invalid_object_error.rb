class InvalidObjectError < StandardError
  def initialize(object, method)
    super("InvalidObjectError: #{object.class} does not respond to ##{method}")
  end
end

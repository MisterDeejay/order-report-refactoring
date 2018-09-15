require_relative 'class_validator'

class DateValidator < ClassValidator
  KLASS = 'Time'.freeze

  def initialize(time)
    super(time, KLASS)
  end
end

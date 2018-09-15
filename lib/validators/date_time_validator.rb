require_relative 'class_validator'

class DateTimeValidator < ClassValidator
  KLASS = 'DateTime'.freeze

  def initialize(datetime)
    super(datetime, KLASS)
  end
end

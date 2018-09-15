require_relative 'class_validator'

class DateValidator < ClassValidator
  KLASS = 'Date'.freeze

  def initialize(date)
    super(date, KLASS)
  end
end

require_relative 'class_validator'

class DateValidator < ClassValidator
  CLASSES = ['Date'.freeze, 'DateTime'.freeze, 'Time'.freeze]

  def initialize(date)
    super(date, CLASSES)
  end
end

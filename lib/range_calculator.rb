# This class serves as a base class for calculating
# the total number of objects whose attribute falls
# between the dates passed in as a start and end
# date. The attribute, whose name can be passed in
# as a symbol or string, must be a class comparable
# with another date and/or time.
class RangeCalculator
  DATE_ERROR_MSG = "RangeCalculatorError: input date is not a valid date class".freeze

  # Sets instance variables for the array of
  # objects, attribute name start_date and
  # end_date
  def initialize(objects_arr, attribute, start_date, end_date)
    @objects_arr = objects_arr
    @attribute = attribute
    @start_date = start_date
    @end_date = end_date
  end

  # Filters out objects in @objects_arr whose value
  # for @attribute falls between @start_date and
  # @end_date
  #
  # * Returns an array of objects in @objects_arr
  # * whose value returned by @attribute is between
  # * @start_date and @end_date
  # * Validates the class types of @objects_arr,
  # * @start_date, @end_date and the objects in
  # * @objects_arr raising an error if an improper
  # * class is used.
  def execute
    validate_date(@start_date)
    validate_date(@end_date)
    validate_objects_arr

    return [] if @objects_arr.empty?
    validate_objects_arr_content

    objects_within_range = @objects_arr.select do |object|
      datetime = object.send(@attribute).to_datetime
      datetime >= @start_date.to_datetime && datetime <= @end_date.to_datetime
    end
  end

  private

  # Validates that @objects_arr is an object that
  # has the :each & :empty? methods
  #
  # * Uses the ObjectRespondsToValidator to ensure
  # * that @objects_arr is an object that responds
  # * to the common array methods, :each & :empty?,
  # * raising an error if they do not respond to
  # * either method
  # * This must be done rather than just checking
  # * that the object is an Array because the object
  # * returned by an ActiveRecord query is not an
  # * Array, but an ActiveRecord_Relation, a wrapper
  # * class around the common Ruby Array with access
  # * to all of its methods
  def validate_objects_arr
    ObjectRespondsToValidator.new(@objects_arr, :each).validate
    ObjectRespondsToValidator.new(@objects_arr, :empty?).validate
  end

  # Validates content is @objects_arr
  #
  # * Uses the ObjectRespondsToValidator to ensure
  # * that the objects in @objects_arr respond to
  # * a method named after the valued stored in
  # * @attribute, raising an error if any object
  # * does not
  def validate_objects_arr_content
    @objects_arr.each do |object|
      ObjectRespondsToValidator.new(object, @attribute).validate
    end
  end

  # Validates the class of a date
  #
  # * Uses the DateValidator to ensure that the date
  # * is either a Date, DateTime or Time class, the only
  # * objects comparable with each other, and raises a
  # * RangeCalculatorError if the date is not one of
  # * these three classes
  def validate_date(date)
    unless (DateValidator.new(date).valid? ||
      DateTimeValidator.new(date).valid? ||
      TimeValidator.new(date).valid?)
      raise RangeCalculatorError.new(DATE_ERROR_MSG)
    end
  end
end

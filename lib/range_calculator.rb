class RangeCalculator
  def initialize(objects_arr, attribute, start_date, end_date)
    @objects_arr = objects_arr
    @attribute = attribute
    @start_date = start_date
    @end_date = end_date
  end

  def execute
    validate_date_input
    validate_objects_arr
    return [] if @objects_arr.empty?
    validate_objects_arr_content

    objects_within_range = @objects_arr.select do |object|
      datetime = object.send(@attribute).to_datetime
      datetime >= @start_date.to_datetime && datetime <= @end_date.to_datetime
    end
  end

  private

  def validate_objects_arr
    ObjectRespondsToValidator.new(@objects_arr, :each).validate
    ObjectRespondsToValidator.new(@objects_arr, :empty?).validate
  end

  def validate_objects_arr_content
    @objects_arr.each do |object|
      ObjectRespondsToValidator.new(object, @attribute).validate
    end
  end

  def validate_start_date
    DateValidator.new(@start_date).valid? ||
      DateTimeValidator.new(@start_date).valid? ||
      TimeValidator.new(@start_date).valid?
  end

  def validate_end_date
    DateValidator.new(@end_date).valid? ||
      DateTimeValidator.new(@end_date).valid? ||
      TimeValidator.new(@end_date).valid?
  end
end

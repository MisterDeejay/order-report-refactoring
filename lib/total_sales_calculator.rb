require_relative 'range_calculator'

class TotalSalesCalculator < RangeCalculator
  def initialize(objects_arr, attribute, start_date, end_date)
    super(objects_arr, attribute, start_date, end_date)
  end

  def execute
    orders_within_range = super
    orders_within_range.map(&:amount).inject(0, &:+)
  end
end

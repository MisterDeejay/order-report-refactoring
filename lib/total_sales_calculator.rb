require_relative 'range_calculator'

# Subclass of RangeCalculator used to calculate the
# total sales between two dates given as input using
# the attribute passed in as an argument as the
# reference date for when each order was placed
class TotalSalesCalculator < RangeCalculator
  def initialize(orders, attribute, start_date, end_date)
    super(orders, attribute, start_date, end_date)
  end

  # Returns total sales of objects placed between
  # @start_date and @end_date
  #
  # * Method in parent class returns an array of orders
  # * that were placed between @start_date and @end_date
  # * The total sales is founds by summing up all the
  # * values of all these orders' amount attribute and
  # * value is returned
  def execute
    orders_within_range = super
    orders_within_range.map(&:amount).inject(0, &:+)
  end
end

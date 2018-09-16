class OrderReport
  def initialize(orders, start_date, end_date)
    @calculator = TotalSalesCalculator.new(orders, :placed_at, start_date, end_date)
  end

  def execute
    @calculator.execute
  end
end

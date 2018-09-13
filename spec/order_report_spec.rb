require 'spec_helper'
require 'date'
require 'byebug'

describe OrdersReport do
  describe '#execute' do
    it 'returns total sales in range' do
      order_within_range1 = Order.new(5, Date.new(2016, 10, 10))
      order_within_range2 = Order.new(10, Date.new(2016, 10, 15))
      order_out_of_range = Order.new(6, Date.new(2016, 1, 1))
      orders = [order_within_range1, order_within_range2, order_out_of_range]

      start_date = Date.new(2016, 10, 1)
      end_date = Date.new(2016, 10, 31)

      expect(OrdersReport.new(orders, start_date, end_date).execute).to eq(15)
    end
  end
end

require 'spec_helper'
require 'date'
require 'byebug'

describe TotalSalesCalculator do
  describe '#execute' do
    let(:order_within_range1) { Order.new(5, Date.new(2016, 10, 10)) }
    let(:order_within_range2) { Order.new(10, Date.new(2016, 10, 15)) }
    let(:order_out_of_range) { Order.new(6, Date.new(2016, 1, 1)) }
    let(:orders) { [order_within_range1, order_within_range2, order_out_of_range] }
    
    let(:start_date) { Date.new(2016, 10, 1) }
    let(:end_date) { Date.new(2016, 10, 31) }

    it 'returns total sales in range' do
      expect(TotalSalesCalculator.new(orders, :placed_at, start_date, end_date).execute).to eq(15)
    end

    context 'with an empty objects arr an input' do
      it 'returns 0' do
        expect(TotalSalesCalculator.new([], :placed_at, start_date, end_date).execute).to eq(0)
      end
    end
  end
end

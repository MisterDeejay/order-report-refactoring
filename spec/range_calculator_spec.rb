require 'spec_helper'
require 'date'
require 'byebug'

describe RangeCalculator do
  describe '#execute' do
    let(:order_within_range1) { Order.new(5, Date.new(2016, 10, 10)) }
    let(:order_within_range2) { Order.new(10, Date.new(2016, 10, 15)) }
    let(:order_out_of_range) { Order.new(6, Date.new(2016, 1, 1)) }
    let(:orders) { [order_within_range1, order_within_range2, order_out_of_range] }

    let(:start_date) { Date.new(2016, 10, 1) }
    let(:end_date) { Date.new(2016, 10, 31) }

    it 'returns all the objects with attribute values within range' do
      orders_within_range = RangeCalculator.new(orders, :placed_at, start_date, end_date).execute
      expect(orders_within_range.include?(order_within_range1)).to be_truthy
      expect(orders_within_range.include?(order_within_range2)).to be_truthy
      expect(orders_within_range.include?(order_out_of_range)).to be_falsey
    end

    context 'with an invalid objects array as input' do
      it 'uses an ObjectsRespondsToValidator to raise an InvalidObjectError' do
        expect(ObjectRespondsToValidator).to receive(:new).with(order_out_of_range, :each).and_call_original
        expect(ObjectRespondsToValidator).to receive(:new).with(order_out_of_range, :empty?).and_call_original

        expect do
          RangeCalculator.new(order_out_of_range, :placed_at, start_date, end_date).execute
        end.to raise_error(InvalidObjectError)
      end
    end

    context 'with an invalid start date as input' do
      it 'uses an ObjectsRespondsToValidator to raise an InvalidObjectError' do
        expect(DateValidator).to receive(:new).with(nil).and_call_original

        expect do
          RangeCalculator.new(orders, :placed_at, nil, end_date).execute
        end.to raise_error(TypeError)
      end
    end

    context 'with an invalid end date as input' do
      it 'uses an ObjectsRespondsToValidator to raise an InvalidObjectError' do
        expect(DateValidator).to receive(:new).with(start_date).and_call_original
        expect(DateValidator).to receive(:new).with(nil).and_call_original

        expect do
          RangeCalculator.new(orders, :placed_at, start_date, nil).execute
        end.to raise_error(TypeError)
      end
    end

    context 'with an empty objects arr an input' do
      it 'returns an empty array of objects' do
        expect(RangeCalculator.new([], :placed_at, start_date, end_date).execute).to eq([])
      end
    end
  end
end

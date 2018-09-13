require 'spec_helper'

describe Order do
  context 'attributes' do
    let(:amount) { 5.0 }
    let(:date) { Date.new(2016, 10, 10) }
    let(:order) { Order.new(amount, date) }

    it '#placed_at' do
      expect(order.placed_at).to eq(date)
    end

    it '#amount' do
      expect(order.amount).to eq(amount)
    end
  end
end

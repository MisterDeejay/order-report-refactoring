require 'spec_helper'

shared_examples_for 'a date validator' do
  describe '#valid?' do
    context 'given an object with a matching class as input' do
      it 'returns true' do
        expect(described_class.new(valid_object).valid?).to be_truthy
      end
    end

    context 'given an object that does not match the class given as input' do
      it 'returns false' do
        expect(described_class.new(invalid_object).valid?).to be_falsey
      end
    end
  end
end

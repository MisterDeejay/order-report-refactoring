require 'spec_helper'
require 'byebug'

describe DateValidator do
  describe '#validate' do
    context 'given a date or time as input' do
      it 'returns true' do
        expect(DateValidator.new(Time.now).validate).to be_truthy
      end
    end

    context 'not given a date as input' do
      it 'raises a TypeError' do
        expect do
          DateValidator.new('my_string').validate
        end.to raise_error(TypeError)
      end
    end
  end
end

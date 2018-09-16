require 'spec_helper'
require 'byebug'

describe ObjectRespondsToValidator do
  describe '#validate' do
    context 'given a method the input object responds to' do
      it 'returns true' do
        expect(ObjectRespondsToValidator.new([1, 2, 3], :each).validate).to be_truthy
        expect(ObjectRespondsToValidator.new([1, 2, 3], 'each').validate).to be_truthy
      end
    end

    context 'given a method the input object does not respond to' do
      it 'raises an InvalidObjectError' do
        expect do
          ObjectRespondsToValidator.new(123, :each).validate
        end.to raise_error(InvalidObjectError)
      end
    end

    context 'method name input is not given as a symbol or string' do
      it 'raises an InvalidObjectError' do
        expect do
          ObjectRespondsToValidator.new(123, 0).validate
        end.to raise_error(TypeError)
      end
    end
  end
end

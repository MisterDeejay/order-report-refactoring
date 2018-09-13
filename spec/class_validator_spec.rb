require 'spec_helper'
require 'byebug'

describe ClassValidator do
  describe '#validate' do
    context 'given an object with a matching class in its array' do
      it 'returns true' do
        expect(ClassValidator.new('my_string', ['String', 'Array', 'Float']).validate).to be_truthy
      end
    end

    context 'given an object that does not match any class in its input' do
      it 'raises a TypeError' do
        expect do
          ClassValidator.new('my_string', ['Array']).validate
        end.to raise_error(TypeError)
      end
    end

    context 'not given an array an its class_arr input' do
      it 'raises a TypeError' do
        expect do
          ClassValidator.new('my_string', 'String').validate
        end.to raise_error(TypeError)
      end
    end
  end
end

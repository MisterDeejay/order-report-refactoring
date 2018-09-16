require 'spec_helper'
require 'byebug'

describe ClassValidator do
  describe '#valid?' do
    context 'given an object with a matching class as input' do
      it 'returns true' do
        expect(ClassValidator.new('my_string', 'String').valid?).to be_truthy
      end
    end

    context 'given an object that does not match the class given as input' do
      it 'returns false' do
        expect(ClassValidator.new('my_string', 'Array').valid?).to be_falsey
      end
    end

    context 'not given a String as input for the class name' do
      it 'raises a TypeError' do
        expect do
          ClassValidator.new('my_string', String).valid?
        end.to raise_error(TypeError)
      end
    end
  end
end

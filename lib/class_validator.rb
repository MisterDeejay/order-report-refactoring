require 'date'

class ClassValidator
  def initialize(object, class_arr)
    @object = object
    @class_arr = class_arr
  end

  def validate
    unless valid_type?(@class_arr, ['Array'])
      raise TypeError.new('TypeError: Input class to validate with must be in '\
                          'an array')
    end

    unless valid_type?(@object, @class_arr)
      raise TypeError.new('TypeError: Input' << @date << 'is not the correct '\
                          'class')
    end

    true
  end

  private

  def valid_type?(object, class_arr)
    class_arr.each do |klass|
      return true if object.is_a?(Object.const_get(klass))
    end

    false
  end
end

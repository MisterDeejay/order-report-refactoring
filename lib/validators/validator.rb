# Base class for all validator classes. Validator
# classes follow one or both of the following
# patterns. #validate will raise an error if
# unable to validate based on the given input,
# whereas #valid? will return fail silently by
# only returning false. Both return true when
# valid.
class Validator
  STRING_CLASS = 'String'.freeze
  SYMBOL_CLASS = 'Symbol'.freeze

  def initialize(object)
    @object = object
  end

  protected

  # Determine whether the input string matches
  # the input object
  #
  # * checks for equality between the object's
  # * class in string form and return true if
  # * the two are equal, returning false
  # * otherwise
  def object_matches_class?(object, klass)
    object.class.to_s == klass
  end
end

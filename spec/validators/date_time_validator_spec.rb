require 'spec_helper'

describe DateTimeValidator do
  it_behaves_like 'a date validator' do
    let(:valid_object) { DateTime.now }
    let(:invalid_object) { Time.now }
  end
end

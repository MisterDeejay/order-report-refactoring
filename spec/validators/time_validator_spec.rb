require 'spec_helper'

describe TimeValidator do
  it_behaves_like 'a date validator' do
    let(:valid_object) { Time.now }
    let(:invalid_object) { DateTime.now }
  end
end

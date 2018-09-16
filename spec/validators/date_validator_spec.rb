require 'spec_helper'

describe DateValidator do
  it_behaves_like 'a date validator' do
    let(:valid_object) { Date.today }
    let(:invalid_object) { Time.now }
  end
end

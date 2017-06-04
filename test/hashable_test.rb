require 'test_helper'

class Hashable::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Hashable
  end

  test 'version' do
    assert_equal '0.1.0', Hashable::VERSION
  end
end

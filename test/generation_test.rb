require 'test_helper'

class GenerationTest < ActiveSupport::TestCase
  def setup
    @configuration = Hashable::Configuration.new(User)
    @generation    = Hashable::Generation.new(@configuration)
  end

  test 'valid encoded id' do
    assert_equal 'ejRe', @generation.encode(1)
    assert_equal 'bk5e', @generation.encode(2)
    assert_equal 'el5a', @generation.encode(3)
  end
end
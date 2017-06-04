require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase
  def setup
    @configuration = Hashable::Configuration.new(User)
  end

  ##
  # Salt
  #

  test 'valid salt configuration' do
    @configuration.salt = 'abc'
    assert_equal 'abc', @configuration.salt
  end

  test 'invalid salt configuration' do
    assert_raises ArgumentError do
      @configuration.salt = 1
    end
  end

  ##
  # Alphabet
  #

  test 'valid alphabet configuration' do
    alphabet = 'abcdefghijklm'
    @configuration.alphabet = alphabet
    assert_equal alphabet, @configuration.alphabet
  end

  test 'invalid alphabet configuration' do
    assert_raises ArgumentError do
      @configuration.alphabet = 'a bcdef'
    end

    assert_raises ArgumentError do
      @configuration.alphabet = 123456
    end
  end

  ##
  # Min length
  #

  test 'valid min_length configuration' do
    @configuration.min_length = 6
    assert_equal 6, @configuration.min_length
  end

  test 'invalid min_length configuration' do
    assert_raises ArgumentError do
      @configuration.min_length = 'a'
    end

    assert_raises ArgumentError do
      @configuration.min_length = 0
    end
  end
end
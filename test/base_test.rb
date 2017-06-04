require 'test_helper'

class BaseTest < ActiveSupport::TestCase
  def setup
    @user = User.create

    @base = Hashable::Base.new(User)
    @base.model_instance = @user
  end

  test 'instance responds to methods' do
    assert_respond_to @base, :config
    assert_respond_to @base, :generate
  end

  test 'valid config call' do
    assert_nothing_raised do
      @base.config do |c|
        c.attr = :short_id
      end
    end
  end

  test 'config method requires block' do
    assert_raises LocalJumpError do
      @base.config
    end
  end

  test 'valid generation' do
    @base.config do |c|
      c.attr = :short_id
    end

    assert_nothing_raised do
      @base.generate
    end
  end

  # Default attr is hash_id and User model doesn't have it
  test 'invalid generation' do
    assert_raises NoMethodError do
      @base.generate
    end
  end
end

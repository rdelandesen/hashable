require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user  = User.create
    @user2 = User.create
  end

  test 'user hashable methods' do
    user = User.new
    assert(user.respond_to? :hashable)
    assert(user.respond_to? :generate_hashable)
  end

  test 'User hashable method' do
    assert(User.respond_to? :hashable)
  end

  test 'valid user with short_id' do
    assert_not_nil @user.short_id
    assert_equal('kbo', @user.short_id)
  end

  test 'valid user2 with short_id' do
    assert_not_nil @user2.short_id
    assert_equal('Kzx', @user2.short_id)
  end
end

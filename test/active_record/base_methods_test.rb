require 'test_helper'

class ActiveRecord::BaseMethodsTest < ActiveSupport::TestCase
  def setup
    @object = Object.new
    @object.extend(Hashable::ActiveRecord::BaseMethods)
  end

  test 'object responds to hashable' do
    assert_respond_to @object, :hashable
  end

  test 'hashable returns base instance' do
    assert_kind_of Hashable::Base, User.new.hashable
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new

    # Asserts that this expression is not truthy. If it is passing, then user.save is false
    # assert_not user.save
    # Asserts that this expression is truthy. If it is passing, then user.save is true
    assert user.save
  end
end

require 'test_helper'

class UserPolicyTest < ActiveSupport::TestCase
  def test_scope
  end

  def test_show
  end

  def test_create
  end

  def test_update
  end

  def test_destroy
  end
end
require 'test_helper'

class UserPolicyTest < ActiveSupport::TestCase
  def setup
    @admin = users(:admin)
    @user = users(:user)
    @other_user = users(:other_user)
  end

  def test_scope
    assert_equal UserPolicy::Scope.new(@admin, User).resolve.count, User.count
  end

  def test_show
    assert UserPolicy.new(@admin, @user).show?
    assert UserPolicy.new(@admin, @other_user).show?
    assert UserPolicy.new(@user, @user).show?
    assert_not UserPolicy.new(@user, @other_user).show?
  end

  def test_update
    assert UserPolicy.new(@admin, @user).update?
    assert UserPolicy.new(@user, @user).update?
    assert_not UserPolicy.new(@user, @other_user).update?
  end

  def test_permitted_attributes
    assert_equal [:first_name, :last_name, :email, :password, :password_confirmation], UserPolicy.new(@user, @user).permitted_attributes
    assert_equal [:role], UserPolicy.new(@admin, @user).permitted_attributes
  end
end

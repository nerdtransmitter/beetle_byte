require 'test_helper'

class UserPolicyTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @admin = users(:admin)
    @user = users(:user)
    @other_user = users(:other_user)
  end

  def test_scope
    puts "Testing UserPolicy::Scope"
    puts "Admin count: #{UserPolicy::Scope.new(@admin, User).resolve.count}"
    puts "User count: #{User.count}"
    assert_equal UserPolicy::Scope.new(@admin, User).resolve.count, User.count
  end

  def test_show
    puts "Testing UserPolicy#show?"
    puts "Admin can show user: #{UserPolicy.new(@admin, @user).show?}"
    puts "Admin can show other user: #{UserPolicy.new(@admin, @other_user).show?}"
    puts "User can show self: #{UserPolicy.new(@user, @user).show?}"
    puts "User cannot show other user: #{UserPolicy.new(@user, @other_user).show?}"
    assert UserPolicy.new(@admin, @user).show?
    assert UserPolicy.new(@admin, @other_user).show?
    assert UserPolicy.new(@user, @user).show?
    assert_not UserPolicy.new(@user, @other_user).show?
  end

  def test_update
    puts "Testing UserPolicy#update?"
    puts "Admin can update user: #{UserPolicy.new(@admin, @user).update?}"
    puts "User can update self: #{UserPolicy.new(@user, @user).update?}"
    puts "User cannot update other user: #{UserPolicy.new(@user, @other_user).update?}"
    assert UserPolicy.new(@admin, @user).update?
    assert UserPolicy.new(@user, @user).update?
    assert_not UserPolicy.new(@user, @other_user).update?
  end

  def test_permitted_attributes
    assert_equal [:first_name, :last_name, :email, :password, :password_confirmation], UserPolicy.new(@user, @user).permitted_attributes
    assert_equal [:role], UserPolicy.new(@admin, @user).permitted_attributes
  end
end

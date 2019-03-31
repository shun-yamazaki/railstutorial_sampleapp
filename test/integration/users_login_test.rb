require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test01)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
    assert_select 'form[action=?]', login_path
    assert_not flash.empty?
    assert_select 'div.alert-danger'
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    assert_template 'sessions/new'
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', logout_path, count: 0
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    assert_redirected_to @user # user_url(@user)
    follow_redirect!
    assert_template 'users/show'
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', user_path(@user)
  end
end

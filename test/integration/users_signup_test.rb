require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: {
        user: {
          name: '',
          email: 'user@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    assert_template 'users/new'
    assert_select 'form[action=?]', signup_path
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post signup_path, params: {
        user: {
          name: 'Test User',
          email: 'user@test.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert_select 'div.alert-success'
    assert is_logged_in?
  end
end

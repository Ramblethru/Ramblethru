require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'get new is successful' do
    get :new
    assert_kind_of User, assigns(:user)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    user_params = { name: 'Albert',
                    email: 'albert@me.org',
                    password: 'password',
                    password_confirmation: 'password' }
    assert_difference 'User.count' do
      post :create, user: user_params
    end
    assert_redirected_to new_login_path
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { name: '',
                       email: '',
                       password: '',
                       password_confirmation: '' }
    assert_no_difference 'User.count' do
      post :create, user: invalid_params
    end
    assert_template 'new'
  end
end

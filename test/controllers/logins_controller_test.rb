require 'test_helper'

class LoginsControllerTest < ActionController::TestCase context 'GET :new' do
  setup { get :new }

  should respond_with(:ok)
  should render_template(:new)
end

  def valid_login_info
    { email: users(:one).email,
      password: 'password' }
  end

  def invalid_login_info
    { email: '',
      password: '' }
  end

  context 'POST :create' do
    context 'when I send invalid information, should not create session' do
      setup { post :create, session: invalid_login_info }

      should set_the_flash[:error]
      should render_template(:new)
    end
    context 'when I send valid info' do
      setup { post :create, session: valid_login_info }

      should 'log in' do
        assert_equal session[:user_id], @current_user
      end

      should 'redirect to home' do
        assert_response :ok
        assert_redirected_to root_path
      end
    end
  end

  context 'DELETE sessions#destroy' do
    setup { delete :destroy, {}, session }

    should 'redirect to home' do
      assert_redirected_to root_path
    end

    should 'log out' do
      assert_nil session[:current_user_id]
    end
  end
end

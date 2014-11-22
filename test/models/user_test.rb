require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)
  should have_secure_password

  should_not allow_value('@').for(:email)
  should_not allow_value('BAD EMAIL').for(:email)
  should_not allow_value(' email@email.com').for(:email)
end

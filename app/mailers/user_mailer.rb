class UserMailer < ActionMailer::Base
  default from: "donotreply@ramble.com"

  def user_created(user)
    @user = user
    mail to: user.email, subject: "Account created!"
  end
end

class RambleMailer < ActionMailer::Base
  default from: "donotreply@ramble.com"

  def ramble_created(user, ramble)
    @user = user
    @ramble = ramble
    mail to: user.email, subject: "You have created a ramble!"
  end
end

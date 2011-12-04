class UserMailer < ActionMailer::Base
  default from: "orakel@isfit.org"

  def new_password(user)
    @user = user
    @url = "https://internal.isfit.org/user/edit"
    mail(:to => user.private_email, :subject => "[ISFiT Orakel] A new password has been generated")
  end
end

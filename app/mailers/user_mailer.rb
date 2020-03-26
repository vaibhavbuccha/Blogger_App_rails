class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
  def new_user(user)
    @user = user.name

    mail to: user.email,
    	 subject: "Welcome #{user.name}"
  end
end

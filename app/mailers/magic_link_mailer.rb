# app/mailers/magic_link_mailer.rb
class MagicLinkMailer < ApplicationMailer
  def send_magic_link
    @user = params[:user]
    @url  = auth_email_callback_url(token: @user.login_token)
    mail(to: @user.email, subject: "Your login link")
  end
end

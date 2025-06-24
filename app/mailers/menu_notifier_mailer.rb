class MenuNotifierMailer < ApplicationMailer
  default from: 'yourmail' 

  def new_menu_email(user, menu)
    @user = user
    @menu = menu

    @user.generate_login_token!
    @magic_link = login_via_token_url(token: @user.login_token)

    mail(
        to: @user.email,
        subject: "🍽️ New Menu Available for #{menu.menu_date.strftime('%B %d, %Y')}"
    )
   end

end

 

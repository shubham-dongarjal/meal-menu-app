# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # def google_oauth2
  #   auth = request.env['omniauth.auth']
  #   @user = User.from_omniauth(auth)

  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication
  #     set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
  #   else
  #     Rails.logger.error "OAuth failed for #{auth.info.email}: #{@user.errors.full_messages}"
  #     session["devise.google_data"] = auth.info
  #     redirect_to root_path, alert: "Could not authenticate you from Google: #{@user.errors.full_messages.join(', ')}"
  #   end
  # end
  
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

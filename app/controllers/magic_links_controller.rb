class MagicLinksController < ApplicationController

    skip_before_action :authenticate_user!
 

    def login
        user = User.find_by(login_token: params[:token])

        if user&.login_token_valid?
            sign_in(user)
            user.clear_login_token!
            redirect_to root_path, notice: "Logged in successfully!"
        else
            redirect_to new_user_session_path, alert: "Invalid or expired login link."
        end
    end

    def auth_request
        # Render a form where user can enter email
    end

    def auth_callback
        user = User.find_by(login_token: params[:token])

        if user&.login_token_valid?
            sign_in(user)
            user.clear_login_token!
            redirect_to root_path, notice: "Signed in successfully via magic link!"
        else
            redirect_to auth_email_path, alert: "Invalid or expired token."
        end
    end

    def create
        user = User.find_or_initialize_by(email: params[:email])
        if user.new_record?
            user.name = params[:email].split('@').first.capitalize # Optional default name
            user.password = SecureRandom.base58(16) + "Aa1!" # Assign a random password
            user.organization = Organization.first
            user.save!
        end

        user.generate_login_token!
        MagicLinkMailer.with(user: user).send_magic_link.deliver_later

        redirect_to root_path, notice: "Check your email for a login link."
    end
end

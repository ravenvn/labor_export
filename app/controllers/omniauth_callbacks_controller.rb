class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    handle_redirect('devise.facebook_data', 'Facebook')
  end

  def google_oauth2
    handle_redirect('devise.google_data', 'Google')
  end

  private

  def handle_redirect(_session_variable, kind)
    # Use the session locale set earlier; use the default if it isn't available.
    I18n.locale = session[:omniauth_login_locale] || I18n.default_locale
    # if User.find_by(email: user.email).nil?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
    # else
      # set_flash_message(:alert, :existed, kind: kind)
      # redirect_to new_user_session_path
    # end
  end

  def user
    User.from_omniauth(request.env["omniauth.auth"])
  end
end

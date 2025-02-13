class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    Rails.logger.info("OmniAuth Facebook callback initiated")
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url, alert: 'Authentication failed. Please try again or sign up.'
    end
  end

  def failure
    Rails.logger.error("OmniAuth failure: #{params[:message]}")
    redirect_to root_path, alert: "Authentication failed: #{params[:message]}"
  end
end

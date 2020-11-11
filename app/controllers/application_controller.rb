class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname , :email , :password , :password_confirmation , :first_name , :last_name , :first_name_kana , :last_name_kana , :birth_date]
    )
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:email , :password])
  end
end

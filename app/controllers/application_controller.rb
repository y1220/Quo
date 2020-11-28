class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  


  def set_current_user
    @current_user= User.find_by(id: session["warden.user.user.key"][0]) if !session["warden.user.user.key"].nil?
  end

  def authenticate_user
    if @current_user==nil
      redirect_to("/login")
    end
  end

  def forbid_login_user
    # already loginned
    if @current_user
      redirect_to("/posts")
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end

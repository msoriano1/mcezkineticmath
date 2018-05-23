class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def not_for_student
        if student_signed_in? 
          redirect_to yearlevels_path, notice: "Access Denied"
        end
    end

  protected
  def configure_permitted_parameters
    added_attrs = [:susername, :firstname, :lastname, :password, :password_confirmation, :remember_me, :pusername]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  

end



class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  # 
  # żeby użytkownicy mogli nadawać sobie admina
  # 
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:admin])
  # end

    def is_admin?
        # check if user is a admin
        # if not admin then redirect to where ever you want 
        redirect_to root_path unless current_user.try(:admin?)
    end


end

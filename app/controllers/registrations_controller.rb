# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
    skip_before_action :require_no_authentication
  
    private
    def redirect_unless_admin
      unless current_user.try(:admin?)
        flash[:error] = "Tylko admin może tu zajrzeć"
        redirect_to root_path
      end
    end
  
    def sign_up(resource_name, resource)
      true
    end
  end
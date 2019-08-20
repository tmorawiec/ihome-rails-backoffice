# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_flashing_format?
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, :location => after_sign_in_path_for(resource) do |format|
  #     format.json {render :json => resource } # this code will get executed for json request
  #   end
  # end

  def create
    super do


      respond_to do |format|
        format.json do

          render json: {
                      id: current_user.id,
                      username: current_user.email,
                      firstName: current_user.email,
                      lastName: current_user.email,
                      token: current_token }.to_json and return

        end

        format.html
      end

      # render json: {
      #                 id: current_user.id,
      #                 username: current_user.email,
      #                 firstName: current_user.email,
      #                 lastName: current_user.email,
      #                 token: current_token }.to_json and return
    end
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end

  # respond_to :html, :json

  #     private

  # def respond_with(resource, _opts = {})


  #   respond_to do |type|
  #     type.html
  #     type.json
  #   end


  # end

  # def respond_to_on_destroy
  #   head :ok
  # end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # # POST /resource/sign_in
#   def create

#  def respond_with(resource, _opts = {})
#     respond_to do |type|
#       type.html
#       type.json { render json: 'dupa' }
#     end
#   end
#   end

  # private
  # def respond_with(resource, _opts = {})
  #     # render json: resource
  #   end
  # def respond_to_on_destroy
  #     # head :ok
  #   end



  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

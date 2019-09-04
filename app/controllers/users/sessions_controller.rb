# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController


  def create
    super do


      respond_to do |format|
        format.json do

          render json: {
                      id: current_user.id,
                      username: current_user.email,
                      firstName: current_user.email,
                      lastName: current_user.email,
                      permission_policy: {
                        room: current_user.permission_policy.io1,
                        bedroom: current_user.permission_policy.io2,
                        kitchen: current_user.permission_policy.io3,
                        bathroom: current_user.permission_policy.io4
                      },
                      token: current_token }.to_json and return

        end

        format.html
      end


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

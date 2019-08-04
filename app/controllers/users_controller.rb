class UsersController < ApplicationController

  before_action :is_admin?, only: [:index, :show, :create]
  before_action :authorize_admin, only: :create
  

  def userzy
    # @users = User.all
    # render :json => @users.as_json(:only => [:id, :email, :admin])
      @users = User.all
      render :json => @users.as_json(:only => [:id, :email, :admin], :include => {:permission_policy => {:only => [:name, :io1, :io2, :io3, :io4]}})
  end


  def edit
    @user = User.find(params[:id])
    @permission_policies = PermissionPolicy.all
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user != @user
     if @user.destroy
       flash[:success] = "Successfully deleted"
     else
       flash[:error] = "Error"
     end
    end
    redirect_to root_path
   end


    def show
      @user = User.find(params[:id])
    end

    def index 
        if current_user.try(:admin?)
        @users = User.all 
        else
          # render html: '<div>Zaloguj się z prawami admina.</div>'.html_safe
        end
    end

    def create
        @user = User.new(params[:user])
    
        if params[:user][:password].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
    
        respond_to do |format|
          if @user.save
            format.html { redirect_to users_path, notice: 'User was successfully created.' }
          else
            format.html { render action: "new" }
          end
        end
      end

        private

    def user_params
      params.require(:user).permit(:email, :password, :admin,  :permission_policy_id)
    end

end

class PermissionPoliciesController < ApplicationController
  
  before_action :is_admin?, only: [:index, :show, :create]
  before_action :authorize_admin, only: :create

  before_action :set_permission_policy, only: [:show, :edit, :update, :destroy]

  # GET /permission_policies
  # GET /permission_policies.json
  def index
    @permission_policies = PermissionPolicy.all
  end

  # GET /permission_policies/1
  # GET /permission_policies/1.json
  def show
  end

  # GET /permission_policies/new
  def new
    @permission_policy = PermissionPolicy.new
  end

  # GET /permission_policies/1/edit
  def edit
  end

  # POST /permission_policies
  # POST /permission_policies.json
  def create
    @permission_policy = PermissionPolicy.new(permission_policy_params)

    respond_to do |format|
      if @permission_policy.save
        format.html { redirect_to @permission_policy, notice: 'Permission policy was successfully created.' }
        format.json { render :show, status: :created, location: @permission_policy }
      else
        format.html { render :new }
        format.json { render json: @permission_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permission_policies/1
  # PATCH/PUT /permission_policies/1.json
  def update
    respond_to do |format|
      if @permission_policy.update(permission_policy_params)
        format.html { redirect_to @permission_policy, notice: 'Permission policy was successfully updated.' }
        format.json { render :show, status: :ok, location: @permission_policy }
      else
        format.html { render :edit }
        format.json { render json: @permission_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_policies/1
  # DELETE /permission_policies/1.json
  def destroy
    @permission_policy.destroy
    respond_to do |format|
      format.html { redirect_to permission_policies_url, notice: 'Permission policy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_policy
      @permission_policy = PermissionPolicy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_policy_params
      params.require(:permission_policy).permit(:name, :io1, :io2, :io3, :io4)
    end
end

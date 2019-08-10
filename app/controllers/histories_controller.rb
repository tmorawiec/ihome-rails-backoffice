class HistoriesController < ApplicationController


    def index
        @histories = History.all
            respond_to do |type|
                type.html # using defaults, which will render weblog/index.html.erb
                type.json   { render :json => @histories.as_json }
            end
        # @switches = Switch.find(:all, :include => [:category])
        # :include => {:permission_policy => {:only => [:name, :io1, :io2, :io3, :io4]}}
        
        # @histories = History.all
        # render :json => @histories.as_json

            # render :json => @histories.as_json(
            #     :only => [:value, :timeStamp], 
            #     :include => [
            #         :switch => {:only => [:name]}, 
            #         :user => {:only => [:email]}]
            #     )
        # render :json => @users.as_json(:only => [:id, :email, :admin], :include => {:permission_policy => {:only => [:name, :io1, :io2, :io3, :io4]}})

    end

    def show
        @history = History.find(params[:id])
        
        render :json => @history.as_json
    end

    def create

        change_params

        @history = History.new(history_params)
        @history.switch_id = @param_switch
        @history.user_id = @param_user
      
        if @history.save
         render json: @history
        else
         render json: @history.errors, status: :unprocessable_entity
        end

    end

    private

        # Never trust parameters from the scary internet, only allow the white list through.
        def history_params
            params.require(:history).permit(:switch_id, :user_id, :value, :timeStamp)
        end

        def change_params
            @switch = Switch.find_by name: params[:switch_name]
            @user = User.find_by email: params[:user_name]
            
            if @user
                @param_user = @user.id
            end
            if @switch
                @param_switch = @switch.id
            end
        end


end



class SwitchesController < ApplicationController

    def index
        @switches = Switch.all
        respond_to do |type|
            type.html
            type.json   { render :json => @switches.as_json(params) }
        end



    end




    def show
        @switch = Switch.find(params[:id])
        @switch_history = @switch.histories.order('id DESC').paginate(page: params[:page])


        respond_to do |type|
            type.html
            type.json   { render :json => @switch.as_json(params)}
        end



        # @user_switches = Switch.all.where(:id => @user.histories.distinct.pluck(:switch_id))

    end


end

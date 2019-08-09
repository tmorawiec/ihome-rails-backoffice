class SwitchesController < ApplicationController
    
    def index
        @switches = Switch.all

        render :json => @switches.as_json(params)


    end

    def show
        @switch = Switch.find(params[:id])
        render :json => @switch.as_json(params)
    end


end

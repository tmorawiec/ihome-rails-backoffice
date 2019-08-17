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
        respond_to do |type|
            type.html 
            type.json   { render :json => @switch.as_json(params)}
        end
        
    end


end

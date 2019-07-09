class HomeController < ApplicationController
    def show
        render template: "home/#{params[:page]}"
    end
end

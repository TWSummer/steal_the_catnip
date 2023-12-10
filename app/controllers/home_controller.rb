class HomeController < ApplicationController
    def index
        @player = current_user
    end
end
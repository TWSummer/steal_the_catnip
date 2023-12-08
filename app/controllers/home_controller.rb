class HomeController < ApplicationController
    def index
        puts "Sasquatch"
        p current_user
    end
end
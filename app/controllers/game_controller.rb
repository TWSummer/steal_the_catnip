class GameController < ApplicationController
    def new
        @player = current_user
    end

    def create
        p "Sasquatch"
        p params
    end

    def lobby
        @game = Game.find_by(room_code:)

    end
end
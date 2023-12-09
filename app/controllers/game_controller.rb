class GameController < ApplicationController
    def new
        @player = current_user
    end

    def create
        current_user.update!(name: params[:player_name])

        game_params = {
            single_player: params[:players] == 'one',
            squad_size:    params[:squad_size]&.to_i,
            round_length:  params[:round_length]&.to_i
        }

        game = Game.create(game_params)

        if game.persisted?
            render json: { success: true, lobby: game_lobby_path(game.room_code) } and return
        else
            render json: { success: false, errors: game.errors.full_messages }
        end
    end

    def lobby
        @game = Game.find_by(room_code: params[:room_code])

    end
end
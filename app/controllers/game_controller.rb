class GameController < ApplicationController
    def new
        @player = current_user
    end

    def create
        current_user.update!(name: params[:player_name])
        is_single_player = (params[:players] == 'one')

        game_params = {
            single_player: is_single_player,
            squad_size:    params[:squad_size]&.to_i,
            round_length:  params[:round_length]&.to_i
        }

        game = Game.new(game_params)
        game.players << current_user
        game.save

        if game.persisted?
            if is_single_player
                # Change this to go directly to the room
                render json: { success: true, lobby: game_lobby_path(game.room_code) } and return
            else
                render json: { success: true, lobby: game_lobby_path(game.room_code) } and return
            end
        else
            render json: { success: false, errors: game.errors.full_messages }
        end
    end

    def lobby
        @game = Game.find_by(room_code: params[:room_code])

    end
end
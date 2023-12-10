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
        game.start! if is_single_player

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

    def ready
        game = Game.find_by(room_code: params[:room_code])
        render json: { success: false, message: 'Unable to locate a game with that room code' } and return unless game

        if game.has_all_players?
            render json: { success: true, ready: true, location: play_game_path(game.room_code) } and return
        else
            render json: { success: true, ready: false } and return
        end
    end

    def play
        @player = current_user
        @game = Game.find_by(room_code: params[:room_code])
        @round = @game.current_round
        @location = @round.location
        @player_cats = @round.cats_available_to_player(@player)
    end

    def join
        name = params[:player_name]
        render json: { success: false, message: 'Please provide your name' } and return unless name

        current_user.update(name: params[:player_name])

        game = Game.find_by(room_code: params[:room_code]&.downcase)
        render json: { success: false, message: 'Unable to locate a game with that room code' } and return unless game

        render json: { success: true, location: play_game_path(game.room_code) } and return if game.players.include?(current_user)

        render json: { success: false, message: 'All players have already joined this game' } and return if game.has_all_players?

        game.players << current_user
        game.start!
        render json: { success: true, location: play_game_path(game.room_code) }
    end
end
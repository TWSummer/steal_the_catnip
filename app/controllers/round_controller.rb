class RoundController < ApplicationController
    def submit
        game = Game.find_by(room_code: params[:room_code])
        render json: { success: false, message: 'Unable to locate a game with this room code' } and return unless game

        round = game.game_rounds.find_by(round_number: params[:round_number]&.to_i)
        render json: { success: false, message: "This game does not have a round with round number = #{params[:round_number]}"} and return unless round

        render json: { success: false, message: 'Player has already chosen cats for this round' } and return if round.cats_chosen_by_player(current_user).any?

        round_cat_ids = params[:selected_cats]&.map(&:to_i)
        render json: { success: false, message: "Wrong number of cats selected. Expected #{game.squad_size}. Received #{round_cat_ids.length}."} and return unless game.squad_size == round_cat_ids.length

        chosen_round_cats = round.round_cats_available_to_player(current_user).where(cat_id: round_cat_ids)
        render json: { success: false, message: "Some of the cats selected were not available to choose." } and return unless chosen_round_cats.length == round_cat_ids.length

        chosen_round_cats.update_all(chosen: true)
        round.round_cats_available_to_player(current_user).where(chosen: nil).update_all(chosen: false)
        round.add_plan_for_player(current_user, params[:plan])

        round.calculate_result! if round.all_players_submitted?
        round.save

        render json: { success: true } and return
    end
end
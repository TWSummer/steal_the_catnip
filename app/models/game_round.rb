class GameRound < ApplicationRecord
    belongs_to :game
    belongs_to :location
    belongs_to :thief, class_name: 'User', foreign_key: 'thief_player_id'
    belongs_to :defender, class_name: 'User', foreign_key: 'defender_player_id'

    has_many :round_cats
    has_many :cats, through: :round_cats

    def draw_cats!(num_cats = 6)
        thief_cats = Cat.where(side: 'thief').limit(num_cats).order("RANDOM()")
        thief_cats.each do |thief_cat|
            round_cats.create!(cat: thief_cat, side: 'thief')
        end

        defender_cats = Cat.where(side: 'defend').limit(num_cats).order("RANDOM()")
        defender_cats.each do |defender_cat|
            round_cats.create!(cat: defender_cat, side: 'defend')
        end
    end

    def cats_available_to_player(player)
        if player.id == thief_player_id
            cats.where(side: 'thief')
        elsif player.id == defender_player_id
            cats.where(side: 'defend')
        else
            raise 'This player is not part of this round'
        end
    end
end

class GameRound < ApplicationRecord
    belongs_to :game
    belongs_to :location
    belongs_to :thief, class_name: 'User', foreign_key: 'thief_player_id'
    belongs_to :defender, class_name: 'User', foreign_key: 'defender_player_id'

    has_many :round_cats
    has_many :cats, through: :round_cats

    def cats_available_to_player(player)
        cats.where(side: player_role(player))
    end

    def round_cats_available_to_player(player)
        round_cats.where(side: player_role(player))
    end

    def cats_chosen_by_player(player)
        cats_available_to_player(player).where('round_cats.chosen = ?', true)
    end

    def player_role(player)
        if player.id == thief_player_id
           'thief'
        elsif player.id == defender_player_id
            'defend'
        else
            raise 'This player is not part of this round'
        end
    end

    def opponent_player(player)
        (player_role(player) == 'thief') ? defender : thief
    end

    def chosen_thief_cats
        cats.where('round_cats.side = ? AND round_cats.chosen = ?', 'thief', true)
    end

    def chosen_defender_cats
        cats.where('round_cats.side = ? AND round_cats.chosen = ?', 'defend', true)
    end

    def add_plan_for_player(player, plan)
        case player_role(player)
        when 'thief'
            self.thief_plan = plan
        when 'defend'
            self.defender_plan = plan
        else
            raise 'This player cannot submit a plan'
        end
    end

    def all_players_submitted?
        !!(thief_plan && defender_plan)
    end

    def calculate_result
        outcome = JSON.parse(Judge.determine_outcome(self))

        self.catnip_stolen = outcome['stolen']
        self.result = outcome['outcome_description']
    end

    def setup_round
        draw_cats
        choose_location
    end

    private

    def draw_cats
        num_cats = 6 # Change to game.num_cats when this is added as a game attribute
        thief_cats = Cat.where(side: 'thief').limit(num_cats).order("RANDOM()")
        thief_cats.each do |thief_cat|
            round_cats.new(cat: thief_cat, side: 'thief')
        end

        defender_cats = Cat.where(side: 'defend').limit(num_cats).order("RANDOM()")
        defender_cats.each do |defender_cat|
            round_cats.new(cat: defender_cat, side: 'defend')
        end
    end

    def choose_location
        self.location = Location.limit(1).order("RANDOM()").first
    end
end

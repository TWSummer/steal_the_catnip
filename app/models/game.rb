class Game < ApplicationRecord
    validates_uniqueness_of :room_code
    validates_presence_of :room_code, :squad_size, :round_length
    validates :round_length, numericality: { greater_than: 0 }
    validates :squad_size, numericality: { greater_than: 0, less_than: 7 }

    has_many :game_players
    has_many :players, through: :game_players
    has_many :game_rounds

    after_initialize do
        next if room_code

        code = rand(36**6).to_s(36)
        while Game.find_by(room_code: code)
            code = rand(36**6).to_s(36)
        end

        self.room_code = code
    end

    def current_round
        game_rounds.order(round_number: :desc).first
    end

    def has_all_players?
        expected_players = single_player ? 1 : 2

        players.count == expected_players
    end

    def start! 
        thief, defender = single_player ? [players.first, nil].shuffle : players.shuffle

        round = game_rounds.new({
            thief:,
            defender:,
            round_number: 1,
        })

        round.setup_round
        round.save!
    end

    def score_for(player)
        game_rounds.where(thief_player_id: player.id, catnip_stolen: true).count + 
            game_rounds.where(defender_player_id: player.id, catnip_stolen: false).count
    end
end

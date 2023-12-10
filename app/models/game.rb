class Game < ApplicationRecord
    validates_uniqueness_of :room_code
    validates_presence_of :room_code, :squad_size, :round_length
    validates :round_length, numericality: { greater_than: 0 }
    validates :squad_size, numericality: { greater_than: 0, less_than: 7 }

    has_many :game_players
    has_many :players, through: :game_players

    after_initialize do
        next if room_code

        code = rand(36**6).to_s(36)
        while Game.find_by(room_code: code)
            code = rand(36**6).to_s(36)
        end

        self.room_code = code
    end

    def has_all_players?
        expected_players = single_player ? 1 : 2

        players.count == expected_players
    end
end

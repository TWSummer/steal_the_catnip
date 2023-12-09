class Game < ApplicationRecord
    validates_uniqueness_of :room_code
    validates_presence_of :room_code, :squad_size, :round_length
    validates :round_length, numericality: { greater_than: 0 }
    validates :squad_size, numericality: { greater_than: 0, less_than: 7 }

    after_initialize do
        next if room_code

        code = rand(36**6).to_s(36)
        while Game.find_by(room_code: code)
            code = rand(36**6).to_s(36)
        end

        self.room_code = code
    end
end

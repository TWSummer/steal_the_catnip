class Game < ApplicationRecord
    validates_uniqueness_of :room_code

    after_initialize do
        break if room_code

        code = rand(36**6).to_s(36)
        while Game.find_by(room_code: code)
            code = rand(36**6).to_s(36)
        end

        self.room_code = code
    end
end

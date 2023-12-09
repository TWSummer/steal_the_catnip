class GamePlayer < ApplicationRecord
    belongs_to :game
    belongs_to :player, class_name: 'User', foreign_key: 'user_id'
end

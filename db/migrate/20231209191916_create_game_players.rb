class CreateGamePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :game_players do |t|
      t.references :game
      t.references :user
      t.timestamps
    end
  end
end

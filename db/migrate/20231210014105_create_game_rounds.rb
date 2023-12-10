class CreateGameRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :game_rounds do |t|
      t.references :game
      t.references :location
      t.integer :round_number
      t.integer :thief_player_id
      t.integer :defender_player_id
      t.string :thief_plan
      t.string :defender_plan
      t.boolean :catnip_stolen
      t.timestamps
    end

    add_index :game_rounds, :thief_player_id
    add_index :game_rounds, :defender_player_id
  end
end

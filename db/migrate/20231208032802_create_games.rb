class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :room_code, null: false
      t.boolean :single_player, null: false
      t.integer :squad_size, null: false
      t.integer :round_length, null: false
      t.timestamps
    end

    add_index :games, :room_code, unique: true
  end
end

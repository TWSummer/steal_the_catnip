class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :room_code, null: false
      t.timestamps
    end

    add_index :games, :room_code, unique: true
  end
end

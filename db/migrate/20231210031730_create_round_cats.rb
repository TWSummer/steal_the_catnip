class CreateRoundCats < ActiveRecord::Migration[7.0]
  def change
    create_table :round_cats do |t|
      t.references :game_round
      t.references :cat
      t.string :side
      t.boolean :chosen
      t.timestamps
    end
  end
end

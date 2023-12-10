class AddResultToGameRounds < ActiveRecord::Migration[7.0]
  def change
    add_column :game_rounds, :result, :string
  end
end

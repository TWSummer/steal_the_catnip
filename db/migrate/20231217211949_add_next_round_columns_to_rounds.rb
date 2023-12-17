class AddNextRoundColumnsToRounds < ActiveRecord::Migration[7.0]
  def change
    add_column :game_rounds, :thief_next_round, :boolean
    add_column :game_rounds, :defender_next_round, :boolean
  end
end

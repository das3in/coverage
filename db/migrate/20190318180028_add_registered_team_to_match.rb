class AddRegisteredTeamToMatch < ActiveRecord::Migration[5.2]
  def change
    remove_index :matches, :home_team_id
    remove_column :matches, :home_team_id
    remove_index :matches, :away_team_id
    remove_column :matches, :away_team_id
    remove_index :matches, :winner_id
    remove_column :matches, :winner_id
    add_reference :matches, :home_team, foreign_key: { to_table: :registered_teams }
    add_reference :matches, :away_team, foreign_key: { to_table: :registered_teams }
    add_reference :matches, :winner, foreign_key: { to_table: :registered_teams }
  end
end

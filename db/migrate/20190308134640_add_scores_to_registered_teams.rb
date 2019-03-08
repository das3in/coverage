class AddScoresToRegisteredTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :registered_teams, :wins, :integer, default: 0
    add_column :registered_teams, :losses, :integer, default: 0
    add_column :registered_teams, :margin, :float, default: 0.0
  end
end

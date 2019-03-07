class AddGroupToRegisteredTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :registered_teams, :group, :string
  end
end

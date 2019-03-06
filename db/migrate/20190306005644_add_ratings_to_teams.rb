class AddRatingsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :current_pbsn_rating, :integer, default: 1500
    add_column :teams, :current_coaches_poll, :integer
    add_column :teams, :current_nxl_rank, :integer
  end
end

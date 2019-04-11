class AddVisibleToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :visible, :boolean, default: true
  end
end

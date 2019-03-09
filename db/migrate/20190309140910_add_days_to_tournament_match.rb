class AddDaysToTournamentMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :current_day, :string, default: "Friday"
    add_column :matches, :day, :string, default: "Friday"
  end
end

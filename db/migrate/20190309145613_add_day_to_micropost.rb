class AddDayToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :day, :string, default: "Friday"
  end
end

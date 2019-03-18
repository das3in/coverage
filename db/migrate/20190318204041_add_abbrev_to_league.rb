class AddAbbrevToLeague < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :abbreviation, :string
  end
end

class AddFirstLastNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :slug, :string

    add_index :users, :slug, unique: true
  end
end

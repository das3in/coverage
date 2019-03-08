class AddCurrentToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :current, :boolean
  end
end

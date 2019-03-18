class AddFeatureFlagToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :feature, :boolean, default: false
  end
end

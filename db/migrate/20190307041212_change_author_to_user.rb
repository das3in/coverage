class ChangeAuthorToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :microposts, :author_id, :user_id
  end
end

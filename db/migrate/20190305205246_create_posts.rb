class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.string :body
      t.boolean :draft, default: true

      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end

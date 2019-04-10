class CreateBunkers < ActiveRecord::Migration[5.2]
  def change
    create_table :bunkers do |t|
      t.string :name
      t.integer :top, default: 100
      t.integer :left, default: 100
      t.integer :rotation, default: 0
      t.references :field, foreign_key: true

      t.timestamps
    end
  end
end

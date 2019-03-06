class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.string :content
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end

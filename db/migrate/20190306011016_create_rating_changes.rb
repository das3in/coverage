class CreateRatingChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_changes do |t|
      t.references :team, foreign_key: true
      t.integer :old_rating
      t.integer :new_rating
      t.references :match, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end

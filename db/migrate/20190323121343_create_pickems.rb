class CreatePickems < ActiveRecord::Migration[5.2]
  def change
    create_table :pickems do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end

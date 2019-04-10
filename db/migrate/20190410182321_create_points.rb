class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.references :match, foreign_key: true
      t.string :start_time
      t.string :end_time
      t.references :winner, foreign_key: { to_table: :registered_teams }

      t.timestamps
    end
  end
end

class CreatePointEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :point_events do |t|
      t.string :bunkerId
      t.string :status
      t.string :eventType
      t.string :playerId
      t.references :point, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :location
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :teams, :slug, unique: true
  end
end

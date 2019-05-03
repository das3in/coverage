class CreateTournamentSets < ActiveRecord::Migration[5.2]
  def change
    create_table :tournament_sets do |t|
      t.integer :order
      t.string :name
      t.references :tournament

      t.timestamps
    end
  end
end

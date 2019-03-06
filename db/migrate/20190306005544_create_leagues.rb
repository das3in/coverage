class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :leagues, :slug, unique: true
  end
end

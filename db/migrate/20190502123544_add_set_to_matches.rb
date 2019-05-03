class AddSetToMatches < ActiveRecord::Migration[5.2]
  def change
    add_reference :matches, :tournament_set, foreign_key: true
  end
end

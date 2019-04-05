class AddPickemPlayerToPickemGuess < ActiveRecord::Migration[5.2]
  def change
    add_reference :pickem_guesses, :pickem_player, foreign_key: true
  end
end

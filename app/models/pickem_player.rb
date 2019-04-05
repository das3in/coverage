class PickemPlayer < ApplicationRecord
  belongs_to :pickem
  belongs_to :user
  has_many :pickem_guesses

  after_create :generate_guesses

  def generate_guesses
    tournament = pickem.tournament

    tournament.matches.each do |match|
      pickem_guesses.create(pickem: pickem, match: match)
    end
  end
end

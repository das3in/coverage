class Field < ApplicationRecord
  belongs_to :tournament

  has_many :bunkers, dependent: :destroy
end

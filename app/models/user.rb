class User < ApplicationRecord
  has_secure_token :authentication_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :microposts
  has_many :posts

  def display_name
    first_name + " " + last_name
  end

  def slug_candidates
    "#{first_name}-#{last_name}"
  end
end

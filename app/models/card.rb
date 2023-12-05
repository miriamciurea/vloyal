class Card < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :card_styles, through: :brand
  has_many :rewards, dependent: :destroy
end

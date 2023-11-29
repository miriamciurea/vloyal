class Card < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_one :card_style, through: :brand
  has_many :rewards, dependent: :destroy
end

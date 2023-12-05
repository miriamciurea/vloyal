class Brand < ApplicationRecord
  belongs_to :reward_type
  belongs_to :category
  belongs_to :card_style

  validates :name, :menu, :website, :description, presence: true
  validates :description, length: { minimum: 60 }
  has_many :cards, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_one_attached :photo

  accepts_nested_attributes_for :locations, allow_destroy: true
end

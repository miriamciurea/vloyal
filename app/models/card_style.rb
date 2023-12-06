class CardStyle < ApplicationRecord
  has_many :brands, dependent: :destroy
  has_one_attached :background
end

class CardStyle < ApplicationRecord
  belongs_to :brand
  has_one_attached :background
end

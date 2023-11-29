class CardStyle < ApplicationRecord
  has_many :brands, dependent: :destroy
end

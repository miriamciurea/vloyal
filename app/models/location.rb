class Location < ApplicationRecord
  belongs_to :brand
  validates :address, presence: true
end

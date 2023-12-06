class Location < ApplicationRecord
  belongs_to :brand
  validates :address, presence: true, uniqueness: { scope: :brand_id }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

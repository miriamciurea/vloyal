class Card < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_one :card_style, through: :brand
  has_many :rewards

  validate :validate_stamps

  def validate_stamps
    if self.stamps <= self.card_style.max_stamps
      errors.add(stamps: 'must be less than max stamps for card style')
    end
  end
end

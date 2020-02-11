class Experience < ApplicationRecord
  validates :experience, presence: true

  belongs_to :user

  has_one :life_area
end

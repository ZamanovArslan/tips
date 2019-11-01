class Tip < ApplicationRecord
  validates :title, presence: true

  has_one :life_area
  belongs_to :user
end

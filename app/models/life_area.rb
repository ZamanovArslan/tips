class LifeArea < ApplicationRecord
  validates :value, uniqueness: true
  validates :en_value, uniqueness: true

  has_many :tips
end

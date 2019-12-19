class LifeArea < ApplicationRecord
  validates :value, uniqueness: true
  validates :en_value, uniqueness: true

  is_impressionable

  has_many :tips
end

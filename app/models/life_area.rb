class LifeArea < ApplicationRecord
  validates :value, uniqueness: true
  validates :en_value, uniqueness: true
end

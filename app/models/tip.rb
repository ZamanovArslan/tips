class Tip < ApplicationRecord
  scope :by_last, ->(date) { where("created_at >= ?", Date.today - date) }
  scope :by_last_month, ->{ where("created_at >= ?", Date.today.change(day: 1)) }
  scope :by_last_year, ->{ where("created_at >= ?", Date.today.change(month: 0, day: 1)) }

  is_impressionable

  validates :title, :life_area, :user, presence: true

  belongs_to :life_area
  belongs_to :user
end

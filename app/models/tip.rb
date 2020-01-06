class Tip < ApplicationRecord
  scope :by_last, ->(date) { where("tips.created_at >= ?", Date.today - date) }
  scope :by_today, ->{ where("tips.created_at >= ?", Date.today.beginning_of_day) }
  scope :by_last_month, ->{ where("tips.created_at >= ?", Date.today.change(day: 1)) }
  scope :by_last_year, ->{ where("tips.created_at >= ?", Date.today.change(month: 1, day: 1)) }

  belongs_to :life_area
  belongs_to :user

  has_many :likes
  has_many :comments
  has_many :users, through: :likes

  paginates_per 10

  is_impressionable

  validates :title, :life_area, :user, presence: true

  def liked?(user)
    return unless user

    users.ids.include?(user.id)
  end
end

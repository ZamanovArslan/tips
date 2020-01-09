class Tip < ApplicationRecord
  scope :by_last, ->(date) { where("tips.created_at >= ?", Time.zone.today - date) }
  scope :by_today, -> { where("tips.created_at >= ?", Time.zone.today.beginning_of_day) }
  scope :by_last_month, -> { where("tips.created_at >= ?", Time.zone.today.change(day: 1)) }
  scope :by_last_year, -> { where("tips.created_at >= ?", Time.zone.today.change(month: 1, day: 1)) }

  paginates_per 10

  is_impressionable

  validates :title, :life_area, :user, presence: true

  belongs_to :life_area
  belongs_to :user

  has_many :likes
  has_many :comments
  has_many :users, through: :likes

  def liked?(user)
    return unless user

    users.ids.include?(user.id)
  end
end

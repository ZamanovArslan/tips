class Like < ApplicationRecord
  belongs_to :tip, counter_cache: true
  belongs_to :user
  validates :user_id, uniqueness: { scope: :tip_id }
end

class Like < ApplicationRecord
  belongs_to :tip, counter_cache: true
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :tip_id
end

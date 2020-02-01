class Feedback < ApplicationRecord
  validates :message, presence: true
end

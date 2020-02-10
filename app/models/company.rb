class Company < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :users, -> { where(company: self) }
end

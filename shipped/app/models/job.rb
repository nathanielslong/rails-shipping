class Job < ApplicationRecord
  has_many :routes
  belongs_to :user
end

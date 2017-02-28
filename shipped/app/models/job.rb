class Job < ApplicationRecord
  has_many :routes

  belongs_to :user

  validates :cost, numericality: { greater_than: 1000, too_cheap: "The job must cost more than $1000!" }
  validates :description, length: { minimum: 50, too_short: "Your description must be at least 50 characters." }
  validates_uniqueness_of :name
end

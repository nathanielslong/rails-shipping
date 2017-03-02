class Job < ApplicationRecord
  has_many :routes

  belongs_to :user

  validates :cost, numericality: { greater_than: 1000, too_cheap: "The job must cost more than $1000!" }
  validates_format_of :cost, :with => /\A\d+(?:\.\d{0,2})?\z/

  validates :needed_containers, numericality: { only_integer: true, not_integer: "Containers must be integers." }

  validates :description, length: { minimum: 50, too_short: "Your description must be at least 50 characters." }

  validates_uniqueness_of :name

end

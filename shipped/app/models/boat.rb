class Boat < ApplicationRecord
  has_many :routes

  belongs_to :user

  validates_uniqueness_of :name
end

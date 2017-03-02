class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :boats

  has_many :jobs

  def available_boats(needed_containers, origin, job_id)
    #search aray for particular boat id job id combo(make)
    assigned_boats = Route.where(job_id: job_id)

    #checks container number
    not_enough_space = self.boats.where("available_containers < #{needed_containers}")

    #checks location number
    not_located = self.boats.where("location != '#{origin}'")

    #need to test
    available_boats = (self.boats.all - Boat.find(assigned_boats.map(&:id)) - Boat.find(not_enough_space.map(&:id)) - Boat.find(not_located.map(&:id))).map{ |e| [e.name, e.id] }
  end

  def full_name
    if first_name
      self.first_name + " " + self.last_name
    else
      "Anonymous"
    end
  end

end

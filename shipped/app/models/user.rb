class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :boats

  has_many :jobs

  def available_boats(needed_containers, origin, job_id)
    #test in console
    #search aray for particular boat id job id combo(make)
    assigned_boats = Route.where(job_id: job_id)
    #checks container number
    enough_space = self.boats.where("available_containers >= #{needed_containers}")
    #checks location number
    located = self.boats.where(location: origin)

    #need to test
    available_boats = (self.boats - Boat.find(assigned_boats.map(&:boat_id)) - Boat.find(enough_space.map(&:boat_id)) - Boat.find(located.map(&:boat_id))).map{ |e| [e.name, e.id] }
  end



  available_boats = self.boats.where("available_containers >= #{needed_containers}")
  #check if origin is same as boat location(fix)
  available_boats = boats.where("location = #{origin}")

def full_name
  if first_name
    self.first_name + " " + self.last_name
  else
    "Anonymous"
  end
end

  end

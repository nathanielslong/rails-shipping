class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :boats

  has_many :jobs

  def full_name
    if first_name
      self.first_name + " " + self.last_name
    else
      "Anonymous"
    end
  end

  end

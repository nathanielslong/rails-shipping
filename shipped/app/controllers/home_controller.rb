class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @routes = Route.all
    @boats = Boat.all
    @jobs = Job.all

    @joblist = @jobs.order("cost DESC")
    @top5 = []
    i = 1
    5.times do
      @top5 << @joblist[i]
      i += 1
    end

    @top3 = Boat.most_routes 
  end
end

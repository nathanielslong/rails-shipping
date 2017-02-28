class JobsController < ApplicationController
  def index
  end

  def new
    @jobs = Job.new()

    @ports = Port.all.collect{ |port| [port.location, port.id]  }
  end

  def edit
    @jobs = Job.find(params[:id])
  end

  def show
  end

  private

  def jobs_params
    params.require(:job).permit(:user_id, :name, :description, :origin, :destination, :cost, :needed_containers)
  end


end

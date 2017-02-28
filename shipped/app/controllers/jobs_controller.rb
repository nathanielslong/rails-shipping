class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_job, only: [:edit, :show]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new()

    @ports = Port.all.collect{ |port| [port.location, port.id]  }
  end

  def edit
  end

  def show
  end

  private

  def job_params
    params.require(:job).permit(:id, :user_id, :name, :description, :origin, :destination, :cost, :needed_containers, :updated_at)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end

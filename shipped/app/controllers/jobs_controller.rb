class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_job, only: [:edit, :show, :update]

  def index
    @jobs = Job.all.order("id DESC")
  end

  def new
    @job = Job.new()

    @ports = Port.all.collect{ |port| [port.location, port.id]  }
  end

  def create
    @job = User.find(current_user).jobs.new
    @job.update_attributes(job_params)

    if @job.save
      flash[:notice] = "Successfully created job!"
      redirect_to job_path(@job)
    else
      flash[:alert] = "Error creating new job."
      render :new
    end

  end

  def edit
  end

  def update
    if @job.update_attributes(job_params)
      flash[:notice] = "Successfully created job!"
      redirect_to job_path(@job)
    else
      flash[:alert] = "Error creating new job."
      render :edit
    end
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

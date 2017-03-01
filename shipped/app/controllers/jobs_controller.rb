class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_job, only: [:edit, :show, :update, :destroy]

  def index
    @jobs = Job.all.order("id DESC")
  end

  def new
    @job = Job.new()

    @ports = Port.all.collect{ |port| [port.location, port.id]  }
  end

  def create
    @job = current_user.jobs.new
    @job.update_attributes(name: job_params[:name],
                           description: job_params[:description],
                           origin: Port.find(job_params[:origin]).location,
                           destination: Port.find(job_params[:destination]).location,
                           cost: job_params[:cost],
                           needed_containers: job_params[:needed_containers])

    if @job.save
      flash[:notice] = "Successfully created job!"
      redirect_to job_path(@job)
    else
      flash[:alert] = "Error creating new job."
      render :new
    end

  end

  def show
    @user = User.find(@job.user_id)
    @route = Route.new()
  end

  def edit
    @user = User.find(@job.user_id)
    @ports = Port.all.collect{ |port| [port.location, port.id]  }
  end

  def update
    if @job.update_attributes(name: job_params[:name],
        description: job_params[:description],
        origin: Port.find(job_params[:origin]).location,
        destination: Port.find(job_params[:destination]).location,
        cost: job_params[:cost],
        needed_containers: job_params[:needed_containers])
      flash[:notice] = "Successfully updated job!"
      redirect_to job_path(@job)
    else
      flash[:alert] = "Error updating job."
      render :edit
    end
  end

  def destroy
    if @job.destroy
      flash[:notice] = "Successfully deleted job!"
      redirect_to jobs_path
    else
      flash[:alert] = "Error deleting job."
    end
  end

  private

  def job_params
    params.require(:job).permit(:id, :user_id, :name, :description, :origin, :destination, :cost, :needed_containers, :updated_at)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end

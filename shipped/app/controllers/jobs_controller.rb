class JobsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end

  def new
    @jobs = Job.new()
    @ports = Port.all
  end

  def new
    @jobs = Job.new()
  end

end

class RoutesController < ApplicationController

  def create
    @route = Route.new()
    @route.update_attributes(route_params)
    if @route.save
      render "jobs/create.js.erb"
    else
      flash[:alert] = "Error creating new route."
      redirect_to :back
    end
  end

  def destroy
    @boat = Boat.where(name: route_params[:boat_id] )
    @route = Route.where(job_id: route_params[:job_id]).to_a
    if @route.first.boat_id == @boat.first.id && @route.first.destroy
      flash[:notice] = "Successfully deleted route!"
      redirect_to :back
    else
      flash[:alert] = "Error in deleting route."
      redirect_to :back
    end
  end

  private

  def route_params
    params.require(:route).permit(:id, :job_id, :boat_id)
  end

end

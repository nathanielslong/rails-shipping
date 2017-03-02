class RoutesController < ApplicationController

  def create
    @route = Route.new()
    @route.update_attributes(route_params)

    if @route.save
      flash[:notice] = "Successfully created route!"
      redirect_to :back
    else
      flash[:alert] = "Error creating new route."
      redirect_to :back
    end

  end

  private

  def route_params
    params.require(:route).permit(:id, :job_id, :boat_id)
  end

end

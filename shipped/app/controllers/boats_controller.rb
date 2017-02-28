class BoatsController < ApplicationController
  def index
  end

  def edit
  end

  def show
    @boats = Boat.find_by(boat_params[:id])
  end

  def new
  end

  def _form
  end

  private

  def set_boat
      @boat = Boat.find(params[:id])
  end


  def boat_params
    params.require(:boat).permit(:image, :name, :location, :total_containers, :available_containers)
  end
end

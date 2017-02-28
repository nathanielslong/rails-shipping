class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def edit
    @boats = Boat.find(params[:id])
  end

  def show
    @boats = Boat.find(params[:id])
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
    params.require(:boat).permit(:id, :image, :name, :location, :total_containers, :available_containers)
  end
end

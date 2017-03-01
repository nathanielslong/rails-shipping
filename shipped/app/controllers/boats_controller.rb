class BoatsController < ApplicationController
  before_action :set_boat, only: [:edit, :show]

  def index
    @boats = Boat.all
  end

  def edit
    
  end

  def show
    
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

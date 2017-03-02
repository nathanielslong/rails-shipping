class BoatsController < ApplicationController
  before_action :set_boat, only: [:update, :show, :edit]

  def index
    @boats = Boat.all
  end

  def update
    @boat.image = boat_params[:image]
    @boat.save

    redirect_to action: show, id: @boat.id 
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

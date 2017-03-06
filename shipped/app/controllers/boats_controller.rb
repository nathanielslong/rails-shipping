class BoatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_boat, only: [:update, :show, :edit, :destroy]

  def index
    @boats = Boat.all
  end

  def edit
    @ports = Port.all.collect{ |port| [port.location, port.id]  }
  end

  def update
    if @boat.update_attributes(name: boat_params[:name],
        location: Port.find(boat_params[:location]).location,
        total_containers: boat_params[:total_containers],
        available_containers: boat_params[:available_containers],
        image: boat_params[:image]) && boat_params[:total_containers] >= boat_params[:available_containers]
      flash[:notice] = "Successfully updated boat profile!"
      redirect_to boat_path(@boat)
    else
      flash[:alert] = "Error creating new boat."
      render :edit
    end
  end

  def show
  end

  def new
    @boat = Boat.new()

    @ports = Port.all.collect{ |port| [port.location, port.id]  }
  end

  def create
    @boat = current_user.boats.new
    @boat.update_attributes(name: boat_params[:name],
                            location: Port.find(boat_params[:location]).location,
                            total_containers: boat_params[:total_containers],
                            available_containers: boat_params[:available_containers],
                            image: boat_params[:image])
    if @boat.save && boat_params[:total_containers] >= boat_params[:available_containers]
      flash[:notice] = "Successfully created boat!"
      redirect_to boat_path(@boat)
    else
      flash[:alert] = "Error creating new boat."
      render :new
    end
  end

  def destroy
    if @boat.destroy
      flash[:notice] = "Successfully deleted boat!"
      redirect_to boats_path
    else
      flash[:alert] = "Error deleting boat."
      redirect_to boats_path
    end
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

class AddressesController < ApplicationController
  before_action :set_location 

  
  def new
    @address = Address.new 
  end

  def create
    @address = Address.new(address_params)
    @location.address = @address 
      if @address.save 
        redirect_to trip_location_path(@location.trip_id, @location) 
      else 
        render :new
      end 
  end

  def edit

  end

  def update

  end

  def destroy 
    @address = Address.find(params[:id])
    @address.destroy 
    redirect_to trip_location_path(@location.trip_id, @location) 
  end

  private 

  def address_params
    params.require(:address).permit(:country, :state, :city, :street)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end
 
end

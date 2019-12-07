class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all 
  end

  def show
    @trip = Trip.find(params[:id]) 
  end

  def new
    @trip = Trip.new 
  end
  
  def create
    binding.pry
    @trip = Trip.new(trip_params)
      if @trip.save 
        redirect_to trips_path
      else 
        render :new 
      end
  end 

  def edit
    @trip = Trip.find(params[:id]) 
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip 
    else 
      render :edit 
    end
  end


  def destroy 
    @trip.destroy 
      redirect_to trips_path 
  end

  private 

  def trip_params 
    params.require(:trip).permit(:name, :description)
  end

  def set_trip
    @trip = Trip.find(params[:id]) 
  end

end




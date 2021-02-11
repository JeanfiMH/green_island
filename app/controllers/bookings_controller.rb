class BookingsController < ApplicationController
  # GET /villagers/villager_id/bookings/new
  def new
    @booking = Booking.new
  end

  # POST /villagers/villager_id/bookings/create
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @villager = Villager.find(params[:villager_id])

    if @booking.save
      redirect_to villager_bookings_path(@villager)
    else
      render :new
    end  
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

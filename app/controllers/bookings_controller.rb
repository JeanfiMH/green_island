class BookingsController < ApplicationController

  # GET /users1/bookings
  def index
    @bookings = policy_scope(current_user.bookings)
    @user = current_user
  end

  # GET /villagers/villager_id/bookings/new
  def new
    @booking = Booking.new
  end

  # POST /villagers/villager_id/bookings/create
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @villager = Villager.find(params[:villager_id])
    @booking.villager = @villager
    authorize @booking

    if @booking.save!
      redirect_to user_bookings_path(current_user)
    else
      render :new
    end
  end

  # GET /users/1/bookings/1
  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  # PATCH /users/1/bookings/1
  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to user_bookings_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to user_bookings_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

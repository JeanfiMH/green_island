class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_villagers = @user.villagers

    @bookings = Booking.where(villager: @my_villagers)

    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
      if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'Your profil was successfully updated!'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :island_name, :island_image, :island_description)
  end

end

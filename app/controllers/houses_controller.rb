class HousesController < ApplicationController

  def new
    @house = House.new
    @villager = Villager.find(params[:villager_id])
    authorize @house
  end

  def create
    @house = House.new(house_params)
    @villager = Villager.find(params[:villager_id])
    @villager.user = current_user
    @house.villager = @villager

    authorize @house

    if @house.save!
      redirect_to villager_path(@villager)
    else
      render :new
    end
  end

  private

  def house_params
    params.require(:house).permit(:photo)
  end
end

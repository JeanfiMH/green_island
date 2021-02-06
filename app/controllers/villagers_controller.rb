class VillagersController < ApplicationController
  def index
    @villagers = Villager.all
  end
  
  def show
    
    @villager = Villager.find(params[:id])
  end




end

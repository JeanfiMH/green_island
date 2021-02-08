class VillagersController < ApplicationController
  before_action :set_villager, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index

  # GET /villagers
  def index
    @villagers = Villager.all
  end

  # GET /villagers/1
  def show
  end

  # GET /villagers/new
  def new
    @villager = Villager.new
  end

  # POST /villagers
  def create
    @villager = Villager.new(villager_params)
    @villager.user = current.user

    if @villager.save
      redirect_to villager_path(@villager)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @villager.update(villager_params)
    redirect_to villager_path(@villager)
  end

  # DELETE /villagers/1
  def destroy
    @villager.destroy
    redirect_to villagers_path, notice: 'Villager was successfully destroyed'
  end

private

  def set_villager
    @villager = Villager.find(params[:id])
  end

  def villager_params
    params.require(:villager).permit(:name, :image_villager, :specie, :gender, :personality, :image_house, :user)
  end

end

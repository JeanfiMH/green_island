class VillagersController < ApplicationController
  before_action :set_villager, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  # GET /villagers
  def index
    @villagers = policy_scope(Villager)
  end

  # GET /villagers/1
  def show
    @booking = Booking.new
  end

  # GET /villagers/new
  def new
    @villager = Villager.new
    authorize @villager
  end

  # POST /villagers
  def create
    @villager = Villager.new(villager_params)
    @villager.user = current_user
    authorize @villager

    if @villager.save
      redirect_to villager_path(@villager), notice: 'Villager was successfully created!'
    else
      render :new
    end
  end

  # GET /villagers/1/edit
  def edit
  end

  #PATCH /villagers/1
  def update
    if @villager.update(villager_params)
      redirect_to villager_path(@villager), notice: 'Villager was successfully updated!'
    else
      render :edit
    end
  end

  # DELETE /villagers/1
  def destroy
    @villager.destroy
    redirect_to villagers_url, notice: 'Villager was successfully destroyed'
  end

  private

  def set_villager
    @villager = Villager.find(params[:id])
    authorize @villager
  end

  def villager_params
    params.require(:villager).permit(:name, :image_villager, :specie, :gender, :personality, :image_house, :photo)
  end

end

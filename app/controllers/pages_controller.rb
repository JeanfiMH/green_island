class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @villagers = Villager.last(8)
    @specie_villagers = Villager.where(specie: "Mouse")
  end
end

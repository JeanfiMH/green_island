class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @villagers = Villager.last(6)
    @specie_villagers = Villager.where(specie: "Cat")
  end
end

class PagesController < ApplicationController
  def home
    @villagers = Villager.last(6)
    @specie_villagers = Villager.where(specie: "Cat")
  end
end

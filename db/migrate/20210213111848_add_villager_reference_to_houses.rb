class AddVillagerReferenceToHouses < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :villager, foreign_key: true
  end
end

class CreateVillagers < ActiveRecord::Migration[6.0]
  def change
    create_table :villagers do |t|
      t.string :name
      t.text :description_villager
      t.string :specie
      t.string :gender
      t.string :personality
      t.string :image_villager
      t.string :image_house
      t.string :description_house
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

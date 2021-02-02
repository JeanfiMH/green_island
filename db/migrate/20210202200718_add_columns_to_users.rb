class AddColumnsToUsers < ActiveRecord::Migration[6.0]

  def change
    add_column :users, :name, :string
    add_column :users, :island_name, :string
    add_column :users, :island_description, :text
    add_column :users, :island_image, :string
  end
end

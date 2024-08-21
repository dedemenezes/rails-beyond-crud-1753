class AddChefNameToRestaurants < ActiveRecord::Migration[7.2]
  def change
    add_column :restaurants, :chef_name, :string
  end
end

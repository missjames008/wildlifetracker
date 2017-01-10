class AddColorToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :color, :string
  end
end

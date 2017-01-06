class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.references :animal, index: true, foreign_key: true
      t.datetime :date_time
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end

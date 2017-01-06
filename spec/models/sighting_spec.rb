require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is a thing' do
    expect{Sighting.new}.to_not raise_error
  end

  it 'has name has an animal Id, date/time, long/lat' do
    animal = Animal.new
    animal.common_name = 'Polar Bear'
    animal.latin_name = 'Ursus maritimus'
    animal.kingdom = 'Animal'
    expect(animal.save).to eq true
    bear = Animal.find_by_common_name 'Polar Bear'
    bear_id = bear.id

    sighting = Sighting.new
    sighting.animal_id = bear_id
    sighting.date_time = DateTime.new(2001,2,3)
    sighting.longitude = 23.2
    sighting.latitude = 46.1
    expect(sighting.save).to eq true

    get_sighting = Sighting.find_by_latitude 46.1
    expect(get_sighting.animal_id).to eq bear_id
    expect(get_sighting.date_time).to eq DateTime.new(2001,2,3)
    expect(get_sighting.longitude).to eq 23.2
  end

  it 'can update a animal currently in the database' do
    animal = Animal.new
    animal.common_name = 'Polar Bear'
    animal.latin_name = 'Ursus maritimus'
    animal.kingdom = 'Animal'
    expect(animal.save).to eq true
    bear = Animal.find_by_common_name 'Polar Bear'
    bear_id = bear.id

    sighting = Sighting.new
    sighting.animal_id = bear_id
    sighting.date_time = DateTime.new(2001,2,3)
    sighting.longitude = 1.1
    sighting.latitude = 2.2
    expect(sighting.save).to eq true

    get_sighting = Sighting.find_by_latitude 2.2
    get_sighting.longitude = 99.0
    expect(get_sighting.save).to eq true

    sighting_test = Sighting.find_by_latitude 2.2
    expect(sighting_test.longitude).to eq 99.0
  end
end

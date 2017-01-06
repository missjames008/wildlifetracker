require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is a thing' do
    expect{Animal.new}.to_not raise_error
  end

  it 'has name has common name, latin name, and kingdom' do
    animal = Animal.new
    animal.common_name = 'Polar Bear'
    animal.latin_name = 'Ursus maritimus'
    animal.kingdom = 'Animal'
    expect(animal.save).to eq true
    get_animal = Animal.find_by_common_name 'Polar Bear'
    expect(get_animal.latin_name).to eq 'Ursus maritimus'
    expect(get_animal.kingdom).to eq 'Animal'
  end

  it 'can list all of the animals in the database' do
    a1 = Animal.new
    a1.common_name = 'Polar Bear'
    a1.latin_name = 'Ursus maritimus'
    a1.kingdom = 'Animal'
    expect(a1.save).to eq true
    a2 = Animal.new
    a2.common_name = 'Bengal Tiger'
    a2.latin_name = 'Panthera tigris tigris'
    a2.kingdom = 'Animal'
    expect(a2.save).to eq true

    animals = Animal.all
    bear = animals.find_by_common_name 'Polar Bear'
    expect(bear.kingdom).to eq 'Animal'
    tiger = animals.find_by_common_name 'Bengal Tiger'
    expect(tiger.kingdom).to eq 'Animal'
  end

  it 'can update a animal currently in the database' do
    animal = Animal.new
    animal.common_name = 'Polar Bear'
    animal.latin_name = 'Ursus maritimus'
    animal.kingdom = 'Animal'
    expect(animal.save).to eq true

    get_animal = Animal.find_by_common_name 'Polar Bear'
    get_animal.kingdom = 'Fish'
    expect(get_animal.save).to eq true
    animal_test = Animal.find_by_common_name 'Polar Bear'
    expect(animal_test.kingdom).to eq 'Fish'
  end

  it 'can destroy a animal currently in the database' do
    animal = Animal.new
    animal.common_name = 'Polar Bear'
    animal.latin_name = 'Ursus maritimus'
    animal.kingdom = 'Animal'
    expect(animal.save).to eq true

    get_animal = Animal.find_by_common_name 'Polar Bear'
    expect{get_animal.destroy}.to_not raise_error
  end

end

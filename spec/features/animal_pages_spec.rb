require 'rails_helper'

RSpec.feature "AnimalPages", type: :feature do
  context "Animal page" do
    Steps "Going to animal page" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I see Animal Listings" do
        expect(page).to have_content("Listing Animals")
      end
    end
  end
end

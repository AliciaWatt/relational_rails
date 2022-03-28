require 'rails_helper'

RSpec.describe 'coaches index page' do
  it 'displays the list of coaches' do
    coach = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    coach_2 = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    coach_3 = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: false, years_experience: 15)

    visit "/coaches"

    save_and_open_page
    expect(page).to have_content(coach.name)
  end
end

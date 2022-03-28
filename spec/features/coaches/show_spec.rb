require 'rails_helper'

RSpec.describe 'coaches show page' do
  it 'displays coaches and attributes' do
    coach = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    coach_2 = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    coach_3 = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: false, years_experience: 15)

    visit "/coaches/#{coach.id}"

    # save_and_open_page
    expect(page).to have_content(coach.name)
    expect(page).to have_content(coach.club)
    expect(page).to have_content(coach.recruiting_athletes)
    expect(page).to have_content(coach.years_experience)
  end
end

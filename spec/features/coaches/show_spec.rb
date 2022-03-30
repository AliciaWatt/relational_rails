require 'rails_helper'

RSpec.describe 'coaches show page' do
  it 'displays coaches and attributes' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: false, years_experience: 15)

    visit "/coaches/#{doc.id}"

    # save_and_open_page
    expect(page).to have_content(doc.name)
    expect(page).to have_content(doc.club)
    expect(page).to have_content(doc.recruiting_athletes)
    expect(page).to have_content(doc.years_experience)
  end
end

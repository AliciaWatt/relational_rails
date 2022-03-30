require 'rails_helper'

RSpec.describe 'coaches index page' do
  it 'displays the list of coaches' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)

    visit '/coaches'

    save_and_open_page
    expect(page).to have_content(doc.name)
    expect(page).to have_content(franklin.name)
    expect(page).to have_content(federer.name)
  end

  scenario 'visitor sees records ordered by #created_at with timestamp' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)
    mac = Coach.create!(name: "Mac Demarco", club: "Boomers", recruiting_athletes: true, years_experience: 10)

    visit '/coaches'

    expect(page).to have_content(doc.created_at)
    expect(page).to have_content(franklin.created_at)
    expect(page).to have_content(federer.created_at)
    expect(page).to have_content(mac.created_at)
  end

  scenario 'visitor sees a link to Coaches index' do

    visit '/coaches'

    click_link "Coaches"

    expect(current_path).to eq('/coaches')
  end

  scenario 'visitor sees a link to Athletes Index' do

    visit '/coaches'

    click_on "Athletes"

    expect(current_path).to eq('/athletes')
  end
end

require 'rails_helper'

RSpec.describe 'athlete index' do
  it 'displays the list of athletes' do
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wednesday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)

    visit "/athletes"
    # save_and_open_page
    expect(page).to have_content(mayo.name)
    expect(page).to have_content(mayo.rank)
    expect(page).to have_content(mayo.championship_qualifier)
    expect(page).to have_content(stanski.name)
    expect(page).to have_content(stanski.rank)
    expect(page).to have_content(stanski.championship_qualifier)
  end


    scenario 'visitor sees a link to Coaches index' do

      visit "/athletes"

      click_link "Coaches"

      expect(current_path).to eq('/coaches')
    end

    scenario 'visitor sees a link to Athletes Index' do

      visit "/athletes"

      click_on "Athletes"

      expect(current_path).to eq('/athletes')
    end
end

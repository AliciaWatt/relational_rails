require 'rails_helper'

RSpec.describe 'athletes show page' do
  it 'displays the athlete attributes' do
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)

    visit "/athletes/#{stanski.id}"


    expect(page).to have_content(stanski.name)
    expect(page).to have_content(stanski.rank)
    expect(page).to have_content(stanski.championship_qualifier)
    expect(page).to_not have_content(andrews.name)
  end

  it 'displays a link to take user to the Coaches Index' do
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)

    visit "/athletes/#{stanski.id}"

    click_on "Coaches"

    # save_and_open_page
    expect(current_path).to eq('/coaches')
  end

  it 'displays a link to take the user to the Athletes Index' do
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)

    visit "/athletes/#{stanski.id}"

    click_on "Athletes"

    expect(current_path).to eq('/athletes')
  end
end

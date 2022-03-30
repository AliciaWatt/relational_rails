require 'rails_helper'

RSpec.describe 'coaches show page' do
  it 'displays coaches and attributes' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)

    visit "/coaches/#{doc.id}"

    save_and_open_page
    expect(page).to have_content(doc.name)
    expect(page).to have_content(doc.club)
    expect(page).to have_content(doc.recruiting_athletes)
    expect(page).to have_content(doc.years_experience)
  end

  it 'displays the total number of athletes a coach has' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)
    mac = Coach.create!(name: "Mac Demarco", club: "Boomers", recruiting_athletes: true, years_experience: 10)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)
    moons = federer.athletes.create!(name: 'Meg Moons', rank:22, championship_qualifier: false)

    visit "/coaches/#{federer.id}"

    # save_and_open_page
    expect(page).to have_content(federer.athletes.count)
    expect(page).to have_content("Total Number of Athletes")
  end

  it 'displays a link to take user to Coaches Index' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)
    mac = Coach.create!(name: "Mac Demarco", club: "Boomers", recruiting_athletes: true, years_experience: 10)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)
    moons = federer.athletes.create!(name: 'Meg Moons', rank:22, championship_qualifier: false)

    visit "/coaches/#{federer.id}"

    click_link "Coaches"

    # save_and_open_page
    expect(current_path).to eq('/coaches')
  end

  it 'displays a link to take the user to the Athlete Index' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)
    mac = Coach.create!(name: "Mac Demarco", club: "Boomers", recruiting_athletes: true, years_experience: 10)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)
    moons = federer.athletes.create!(name: 'Meg Moons', rank:22, championship_qualifier: false)

    visit "/coaches/#{federer.id}"

    click_link "Athletes"

    expect(current_path).to eq('/athletes')
  end

  it 'displays a link to a Coaches Athlete index' do
    doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)
    mac = Coach.create!(name: "Mac Demarco", club: "Boomers", recruiting_athletes: true, years_experience: 10)
    mayo = franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    wednesday = franklin.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    stanski = doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    andrews = doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)
    moons = federer.athletes.create!(name: 'Meg Moons', rank:22, championship_qualifier: false)

    visit "/coaches/#{federer.id}"

    click_link "View this Coach's Roster"

    expect(current_path).to eq("/coaches/#{federer.id}/athletes")
  end
end

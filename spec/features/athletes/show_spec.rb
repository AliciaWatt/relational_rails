require 'rails_helper'

RSpec.describe 'athletes show page' do
  it 'displays the athlete attributes' do
    coach = Coach.create!(name: 'Missy Franklin')
    athlete = coach.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    athlete_2 = coach.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    athlete_3 = coach.athletes.create!(name: 'Staniel Stanski', rank: 2, championship_qualifier: true)
    athlete_4 = coach.athletes.create!(name: 'Merk Andrews', rank: 3, championship_qualifier: false)

    visit "/athletes/#{athlete.id}"

    # save_and_open_page
    expect(page).to have_content(athlete.name)
    expect(page).to have_content(athlete.rank)
    expect(page).to have_content(athlete.championship_qualifier)
  end
end

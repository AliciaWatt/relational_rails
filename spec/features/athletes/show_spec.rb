require 'rails_helper'

RSpec.describe 'athletes show page' do
  it 'displays the athlete attributes' do
    athlete = Athlete.create!(name: 'Jo Mayo', athlete_of: 2, championship_qualifier: true)
    athlete_2 = Athlete.create!(name: 'Ash Wedneday', athlete_of: 1, championship_qualifier: true)
    athlete_3 = Athlete.create!(name: 'Staniel Stanski', athlete_of: 2, championship_qualifier: true)
    athlete_4 = Athlete.create!(name: 'Merk Andrews', athlete_of: 3, championship_qualifier: false)

    visit "/athletes/#{athlete.id}"

    # save_and_open_page
    expect(page).to have_content(athlete.name)
    expect(page).to have_content(athlete.athlete_of)
    expect(page).to have_content(athlete.championship_qualifier)
  end
end

require 'rails_helper'

RSpec.describe 'athletes index page' do
  it 'displays the list of athletes' do
    athlete = Athlete.create!(name: 'Jo Mayo', athlete_of: 2, championship_qualifier: true)
    athlete_2 = Athlete.create!(name: 'Ash Wedneday', athlete_of: 1, championship_qualifier: true)
    athlete_3 = Athlete.create!(name: 'Staniel Stanski', athlete_of: 2, championship_qualifier: true)
    athlete_4 = Athlete.create!(name: 'Merk Andrews', athlete_of: 3, championship_qualifier: false)

    visit "/athletes"

    expect(page).to have_content(athlete.name)
  end
end

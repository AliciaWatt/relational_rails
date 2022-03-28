require 'rails_helper'

RSpec.describe 'Coaches athlete index' do
  it 'displays the list of athletes' do
    coach = Coach.create!(name: 'Missy Franklin')
    athlete = coach.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    athlete_2 = coach.athletes.create!(name: 'Ash Wedneday', rank: 1, championship_qualifier: true)
    athlete_3 = coach.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    athlete_4 = coach.athletes.create!(name: 'Merk Andrews', rank: 4, championship_qualifier: false)

    visit "/athletes"

    expect(page).to have_content(athlete.name)
  end
end

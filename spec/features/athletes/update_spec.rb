require 'rails_helper'

RSpec.describe 'Updating athlete' do
  before :each do
    @doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    @stanski = Athlete.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true, coach_id: @doc.id)
  end

  it 'can link to the update form' do
    visit "/athletes/#{@stanski.id}"

    click_link 'Update Information'

    expect(current_path).to eq("/athletes/#{@stanski.id}/edit")
  end

  it 'allows for attributes to be updated' do

    visit "/athletes/#{@stanski.id}/edit"

    fill_in('Name', with: 'Staniel Stanski Jr.')
    fill_in('rank', with: 2)
    check('championship_qualifier')

    click_button("Submit")
    expect(current_path).to eq("/athletes/#{@stanski.id}")
    expect(page).to have_content('Staniel Stanski Jr.')
    expect(page).to have_content('2')
    expect(page).to have_content('true')
  end
end

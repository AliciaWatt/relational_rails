require 'rails_helper'

RSpec.describe 'New athlete for coach' do
  before :each do
    @doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
    @stanski = Athlete.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true, coach_id: @doc.id)
  end

  it 'can create a new athlete for a coach' do
    visit "/coaches/#{@doc.id}/athletes"

    click_link("Create New Athlete")

    expect(current_path).to eq("/coaches/#{@doc.id}/athletes/new")
  end

  it 'displays a form to create a new athlete' do
    visit "/coaches/#{@doc.id}/athletes/new"

    fill_in('name', with: 'Grizzly Bearet')
    fill_in('rank', with: 9)
    check('championship_qualifier')

    click_button("Create Athlete")
    expect(current_path).to eq("/coaches/#{@doc.id}/athletes")
    expect(page).to have_content('Grizzly Bearet')
    expect(page).to have_content('9')
    expect(page).to have_content('true')
  end
end

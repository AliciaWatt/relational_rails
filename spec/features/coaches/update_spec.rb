require 'rails_helper'

RSpec.describe 'Updating a Coach' do
  before :each do
    @franklin = Coach.create!(name: 'Missy Franklin', club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    @mayo = @franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
  end

  it 'can link to the edit page from a coaches page' do

    visit "/coaches/#{@franklin.id}"

    click_link "Update Coach Info"

    expect(current_path).to eq("/coaches/#{@franklin.id}/edit")
  end

  it 'creates a patch request and updates the Coaches info' do

    visit "/coaches/#{@franklin.id}/edit"

    fill_in('Club', with: 'Dolphinsss')
    fill_in('years_experience', with: 3)
    check('recruiting_athletes')

    click_button("Submit")
    expect(current_path).to eq("/coaches/#{@franklin.id}")
    expect(page).to have_content('Dolphins')
    expect(page).to have_content('2')
    expect(page).to have_content('true')
  end
end

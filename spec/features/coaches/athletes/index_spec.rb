# User Story 5, Parent Children Index
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'

RSpec.describe 'Coaches athletes index' do
  before :each do
    @franklin = Coach.create!(name: 'Missy Franklin', club: "Dolphins", recruiting_athletes: true, years_experience: 2)
    @doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)

    @mayo = @franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    @phelps = @franklin.athletes.create!(name: 'Michael Phelps', rank: 1, championship_qualifier: true)
    @valencia = @franklin.athletes.create!(name: 'Emily valencia', rank: 16, championship_qualifier: false)
    @stanski = @doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
    @andrews = @doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)
  end

  scenario 'visitor sees the name of each athlete associated with a particular coach' do
    visit "/coaches/#{@franklin.id}/athletes"

    # save_and_open_page
    expect(page).to have_content(@mayo.name)
    expect(page).to have_content(@mayo.rank)
    expect(page).to have_content(@mayo.championship_qualifier)
    expect(page).to have_content(@phelps.name)
    expect(page).to have_content(@phelps.rank)
    expect(page).to have_content(@phelps.championship_qualifier)
    expect(page).to_not have_content(@andrews.name)
  end

  it 'links to each athletes show page' do
    visit "/coaches/#{@franklin.id}/athletes"

    click_on @mayo.name

    expect(current_path).to eq("/athletes/#{@mayo.id}")
  end
end

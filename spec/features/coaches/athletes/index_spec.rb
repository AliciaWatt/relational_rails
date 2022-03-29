# User Story 5, Parent Children Index
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'

RSpec.describe 'Coaches athletes index' do
  before :each do
    @franklin = Coach.create!(name: 'Missy Franklin')
    @mayo = @franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
    @phelps = @franklin.athletes.create!(name: 'Michael Phelps', rank: 1, championship_qualifier: true)
    @valencia = @franklin.athletes.create!(name: 'Emily valencia', rank: 6, championship_qualifier: false)
  end

  it 'shows all of the names of the athletes for the coach' do
    visit "/coaches/#{@franklin.id}/athletes"

    expect(page).to have_content(@mayo.name)
    expect(page).to have_content(@phelps.name)
  end

  it 'links to each athletes show page' do
    visit "/coaches/#{@franklin.id}/athletes"

    click_on @mayo.name

    expect(current_path).to eq("/athletes/#{@mayo.id}")
  end

end

require 'rails_helper'

RSpec.describe 'New Coach' do

  it 'can display a link to create a new coach on the index page' do

    visit '/coaches'

    click_on("Create New Coach")

    expect(current_path).to eq('/coaches/new')
  end

  it 'can create a new Coach' do

    visit '/coaches/new'

    fill_in('Name', with: 'Dan Brodanawitz')
    fill_in('Club', with: 'Marlins')
    fill_in('years_experience', with: 7)
    check('recruiting_athletes')

    click_button('Create Coach')
    expect(current_path).to eq('/coaches')
    expect(page).to have_content('Dan Brodanawitz')
    expect(page).to have_content('Marlins')
    expect(page).to have_content("7")
    expect(page).to have_content('true')
  end
end

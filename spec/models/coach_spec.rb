require 'rails_helper'

RSpec.describe Coach do
  it{should have_many :athletes}

  describe 'instance methods' do
    before :each do
      @franklin = Coach.create!(name: 'Missy Franklin')
      @mayo = @franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
      @phelps = @franklin.athletes.create!(name: 'Michael Phelps', rank: 1, championship_qualifier: true)
      @valencia = @franklin.athletes.create!(name: 'Emily valencia', rank: 6, championship_qualifier: false)
    end
  end
end

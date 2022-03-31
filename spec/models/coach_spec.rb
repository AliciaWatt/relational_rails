require 'rails_helper'

RSpec.describe Coach do
  it{should have_many :athletes}
  it{should validate_presence_of :name}
  it{should validate_presence_of :club}


  describe 'instance methods' do
    before :each do
      @franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
      @doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
      @federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)

      @mayo = @franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
      @phelps = @franklin.athletes.create!(name: 'Michael Phelps', rank: 1, championship_qualifier: true)
      @valencia = @franklin.athletes.create!(name: 'Emily valencia', rank: 16, championship_qualifier: false)
      @moons = @federer.athletes.create!(name: 'Meg Moons', rank: 22, championship_qualifier: false)
    end

    it 'counts the number of athletes for a coach' do
      expect(@federer.number_of_athletes).to eq(1)
      expect(@doc.number_of_athletes).to eq(0)
    end
  end

  describe 'class methods' do
    before(:each) do
      @franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
      @doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
      @federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)
    end
    it 'can order a list of coaches by most recent creation date' do
      expect(Coach.desc_order).to eq([@federer, @doc, @franklin])
    end
  end
end

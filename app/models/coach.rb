class Coach < ApplicationRecord
  has_many :athletes
  validates_presence_of :name, :club, :recruiting_athletes, :years_experience

  def self.desc_order
    order(created_at: :desc)
  end

  def number_of_athletes
    self.athletes.count
  end

  def alphabetize
    athletes.order(:name)
  end
end

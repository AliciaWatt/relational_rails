class Athlete < ApplicationRecord
  belongs_to :coach

  def self.alphabetize
    order(:name)
  end

  def self.championship_qualifier?
    where(championship_qualifier: true)
  end

  def self.sort_by_rank(rank)
    where("rank_number > #{rank}")
  end
end

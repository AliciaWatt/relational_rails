class Athlete < ApplicationRecord
  belongs_to :coach, required: false
end

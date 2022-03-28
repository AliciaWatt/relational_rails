require 'rails_helper'

RSpec.describe Athlete, type: :model do
  it{should belong_to :coach}
end

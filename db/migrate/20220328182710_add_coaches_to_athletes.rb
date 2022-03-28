class AddCoachesToAthletes < ActiveRecord::Migration[5.2]
  def change
    add_reference :athletes, :coach, foreign_key: true
  end
end

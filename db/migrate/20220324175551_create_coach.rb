class CreateCoach < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :club
      t.boolean :recruiting_athletes
      t.integer :years_experience

      t.timestamps
    end
  end
end

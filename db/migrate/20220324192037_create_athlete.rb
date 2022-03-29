class CreateAthlete < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :rank
      t.boolean :championship_qualifier

      t.timestamps
    end
  end
end

class CreatePlannedPlaces < ActiveRecord::Migration
  def change
    create_table :planned_places do |t|
      t.datetime :visit_time
      t.integer :place_id
      t.integer :trip_id
      t.integer :votes

      t.timestamps null: false
    end
  end
end

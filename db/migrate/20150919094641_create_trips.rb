class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :created_by
      t.integer :modified_by

      t.timestamps null: false
    end
  end
end

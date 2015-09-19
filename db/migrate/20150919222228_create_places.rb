class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :type
      t.string :created_by
      t.string :price

      t.timestamps null: false
    end
  end
end

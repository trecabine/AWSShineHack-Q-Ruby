class AddCreatedByToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :created_by, :integer
  end
end

class AddLastModifiedByToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :last_modified_by, :integer
  end

end

class CreateUserTripTable < ActiveRecord::Migration
  def self.up
    create_table :trips_users, :id => false do |t|
      t.column :user_id, :integer
      t.column :trip_id, :integer
    end
  end
end

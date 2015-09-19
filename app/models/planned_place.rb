class PlannedPlace < ActiveRecord::Base
  belongs_to :trip
  belongs_to :place
end

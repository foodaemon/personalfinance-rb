class MaintenanceHistory < ActiveRecord::Base
  # relationships
  belongs_to :vehicle, :foreign_key => :vehicle_id

  # validations
  validates :item, :presence => true
  validates :mileage, :presence => true
end

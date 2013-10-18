class Vehicle < ActiveRecord::Base
  # relationships
  has_many :maintenance_histories

  # validation
  validates :color, :presence => true, :length => { :minimum => 2, :maximum => 50 }
  validates :make, :presence => true, :length => { :minimum => 2, :maximum => 50 }
  validates :model, :presence => true, :length => { :minimum => 2, :maximum => 50 }
end

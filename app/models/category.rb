class Category < ActiveRecord::Base
  has_many :transactions
  #attr_accessible :id, :description, :name

  validates :name, :length => { :minimum => 3, :maximum => 25 }
end

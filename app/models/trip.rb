class Trip < ActiveRecord::Base
  default_scope order('created_at DESC')

  attr_accessible :description, :completed_at

  validates :description, :presence => true
  validates :completed_at, :presence => true
end

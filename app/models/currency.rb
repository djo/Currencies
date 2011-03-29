class Currency < ActiveRecord::Base
  has_many :appointments, :dependent => :destroy
  has_many :countries, :through => :appointments

  attr_accessible

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true
end

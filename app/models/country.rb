class Country < ActiveRecord::Base
  has_many :appointments, :dependent => :destroy
  has_many :currencies, :through => :appointments
  has_many :country_trips, :dependent => :destroy
  has_many :trips, :through => :country_trips

  default_scope order('name ASC')

  attr_accessible

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true
end

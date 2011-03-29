class Country < ActiveRecord::Base
  has_many :appointments, :dependent => :destroy
  has_many :currencies, :through => :appointments

  attr_accessible :name, :code

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true
end

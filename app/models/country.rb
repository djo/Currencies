class Country < ActiveRecord::Base
  has_many :country_trips, :dependent => :destroy
  has_many :appointments, :dependent => :destroy

  belongs_to :currency

  default_scope order('name ASC')

  attr_accessible

  validates :currency, :presence => true
  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true
end

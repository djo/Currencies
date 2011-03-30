class Trip < ActiveRecord::Base
  has_many :country_trips, :dependent => :destroy
  has_many :countries, :through => :country_trips

  default_scope order('created_at DESC')

  attr_accessible :description, :completed_at

  validates :description, :presence => true
  validates :completed_at, :presence => true

  def self.dates
    select('DISTINCT completed_at').order('completed_at ASC').map &:completed_at
  end
end

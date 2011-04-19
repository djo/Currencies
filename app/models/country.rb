class Country < ActiveRecord::Base
  has_many :country_trips, :dependent => :destroy
  has_many :appointments, :dependent => :destroy, :inverse_of => :country

  belongs_to :currency

  default_scope order('name ASC')

  attr_accessible :currency, :name, :code

  validates :currency_id, :presence => true
  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true

  def self.by_currency_name(name)
    joins(:currency).where('currencies.name' => name)
  end
end

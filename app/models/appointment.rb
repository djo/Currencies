class Appointment < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  attr_accessible :country_id

  validates :country_id, :presence => true, :uniqueness => { :scope => :user_id }
  validates :user_id, :presence => true

  def self.by_currency_name(name)
    joins(:country => :currency).where('currencies.name' => name)
  end
end

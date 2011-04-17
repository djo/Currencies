class Currency < ActiveRecord::Base
  has_many :countries, :dependent => :destroy

  default_scope order('name ASC')

  attr_accessible :name, :code

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true
end

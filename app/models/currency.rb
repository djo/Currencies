class Currency < ActiveRecord::Base
  has_many :countries, :dependent => :destroy

  default_scope order('name ASC')

  attr_accessible :name, :code

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true

  # Returns grouped currencies with country counts
  def self.grouped_by_name
    select('name, SUM(c_count) AS country_count').
    joins('INNER JOIN (SELECT currency_id, COUNT(*) AS c_count FROM countries GROUP BY 1) as cc ' +
          'ON cc.currency_id = currencies.id').
    group('name').
    order('name')
  end
end


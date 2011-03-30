class Currency < ActiveRecord::Base
  has_many :appointments, :dependent => :destroy
  has_many :countries, :through => :appointments

  attr_accessible :appointments_attributes
  accepts_nested_attributes_for :appointments

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true

  def self.with_country_counts
    select('currencies.*, IFNULL(ac.appointments_count, 0) available_countries,
                          IFNULL(nvc.appointments_count, 0) not_visited_countries').
    joins('LEFT OUTER JOIN (SELECT currency_id, COUNT(*) appointments_count FROM appointments GROUP BY 1) ac
           ON ac.currency_id = currencies.id').
    joins('LEFT OUTER JOIN (SELECT currency_id, COUNT(*) appointments_count FROM appointments WHERE visited = 0 GROUP BY 1) nvc
           ON nvc.currency_id = currencies.id')
  end
end

class Currency < ActiveRecord::Base
  has_many :appointments, :dependent => :destroy
  has_many :countries, :through => :appointments

  attr_accessible :appointments_attributes
  accepts_nested_attributes_for :appointments

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true

  def self.with_country_counts(only_not_visited)
    currencies =  select('currencies.*, ac.appointments_count AS available_countries, ' +
                                       'nvc.appointments_count AS not_visited_countries').
                  joins('LEFT OUTER JOIN (SELECT currency_id, COUNT(*) AS appointments_count FROM appointments GROUP BY 1) ac ' +
                        'ON ac.currency_id = currencies.id').
                  joins('LEFT OUTER JOIN (SELECT currency_id, COUNT(*) AS appointments_count FROM appointments WHERE visited = FALSE GROUP BY 1) nvc ' +
                        'ON nvc.currency_id = currencies.id')

    only_not_visited ? currencies.where('nvc.appointments_count IS NOT NULL') : currencies
  end
end

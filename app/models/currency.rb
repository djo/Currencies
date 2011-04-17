class Currency < ActiveRecord::Base
  has_many :countries, :dependent => :destroy

  default_scope order('name ASC')

  attr_accessible :name, :code

  validates :name, :presence => true
  validates :code, :presence => true, :uniqueness => true

  # Returns grouped currencies with available country counts
  def self.grouped_by_name
    grouped_by_name_query
  end

  # Returns grouped currencies with available and remaining country counts for user
  def self.grouped_by_name_for(user)
    country_ids = user.appointments.map &:country_id

    grouped_by_name_query.
      select('SUM(rc_count) AS remaining_country_count').
      joins("LEFT OUTER JOIN (SELECT currency_id, COUNT(*) AS rc_count
                              FROM countries
                              WHERE id NOT IN (#{country_ids.join(',')}) GROUP BY 1) as rcc " +
            'ON rcc.currency_id = currencies.id')
  end

  private

  def self.grouped_by_name_query
    select('name, SUM(ac_count) AS available_country_count').
    joins('INNER JOIN (SELECT currency_id, COUNT(*) AS ac_count
                       FROM countries
                       GROUP BY 1) as acc ' +
          'ON acc.currency_id = currencies.id').
    group('name').
    order('name')
  end
end

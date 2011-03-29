require 'currency_builder'

namespace :db do
  desc "Load new currencies from web service"
  task :load_currencies => :environment do
    CurrencyBuilder.load
  end

  desc "Create Euro currency"
  task :create_euro_currency => :environment do
    CurrencyBuilder.create_euro
  end
end

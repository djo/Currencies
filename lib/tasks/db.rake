require 'currency_loader'

namespace :db do
  desc "Load new currencies from web service"
  task :load_currencies => :environment do
    CurrencyLoader.load
  end
end

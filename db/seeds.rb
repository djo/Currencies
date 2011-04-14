# Create Mr. Wicked profile
User.create! :email => 'mr.wicked@mail.com', :password => 'password'

# Load currencies from webservice
CurrencyLoader.load

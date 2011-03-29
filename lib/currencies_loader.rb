class CurrenciesLoader
  WSDL_PATH = 'http://www.webservicex.net/country.asmx?WSDL'

  def self.process
    loader = new
    loader.do
  end

  def do
    begin
      client = Savon::Client.new { wsdl.document = WSDL_PATH }
      response = client.request :get_currencies
      currencies_response = response.to_hash[:get_currencies_response][:get_currencies_result]
      doc = Nokogiri::XML currencies_response
      store_currencies doc
    rescue Exception => e
      puts "Currencies Loader Exception: #{e.message}"
    end
  end

  private

  def store_currencies(doc)
    doc.xpath('//Table').each do |node|
      store(:country_name  => node.xpath('./Name').inner_text.strip,
            :country_code  => node.xpath('./CountryCode').inner_text.strip.upcase,
            :currency_code => node.xpath('./CurrencyCode').inner_text.strip.upcase,
            :currency_name => node.xpath('./Currency').inner_text.strip)
    end
  end

  def store(hash)
    appointment = Appointment.new
    appointment.country = build(Country, hash[:country_code], hash[:country_name])
    appointment.currency = build(Currency, hash[:currency_code], hash[:currency_name])
    appointment.save
  end

  def build(model, code, name)
    model.find_by_code(code) || create(model, code, name)
  end

  def create(model, code, name)
    object = model.new
    object.send :attributes=, { :code => code, :name => name }, false
    object.save
    object
  end
end

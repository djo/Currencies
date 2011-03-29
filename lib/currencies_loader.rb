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
      build(:country_name  => node.xpath('./Name').inner_text,
            :country_code  => node.xpath('./CountryCode').inner_text,
            :currency_code => node.xpath('./CurrencyCode').inner_text,
            :currency_name => node.xpath('./Currency').inner_text)
    end
  end

  def build(hash)
    appointment = Appointment.new
    appointment.country = build_country(hash[:country_code], hash[:country_name])
    appointment.currency = build_currency(hash[:currency_code], hash[:currency_name])
    appointment.save
  end

  def build_country(code, name)
    Country.find_or_create_by_code(:code => code.strip, :name => name.strip)
  end

  def build_currency(code, name)
    Currency.find_or_create_by_code(:code => code.strip, :name => name.strip)
  end
end

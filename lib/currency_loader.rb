class CurrencyLoader
  WSDL_PATH = 'http://www.webservicex.net/country.asmx?WSDL'

  def self.load
    builder = new
    builder.fetch
  end

  def fetch
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
    currency = build_currency hash[:currency_code], hash[:currency_name]
    build_country currency, hash[:country_code], hash[:country_name]
  end

  def build_currency(code, name)
    Currency.find_by_code(code) || Currency.create(:code => code, :name => name)
  end

  def build_country(currency, code, name)
    Country.create(:currency => currency, :code => code, :name => name)
  end
end

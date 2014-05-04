class Bitstamp
  def self.ticker
    response = Net::HTTP.get(URI.parse('https://www.bitstamp.net/api/ticker/'))

    JSON.parse(response)
  end
end

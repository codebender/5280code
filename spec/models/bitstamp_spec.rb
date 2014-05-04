require 'spec_helper'

describe Bitstamp do
  describe 'ticker' do
    it 'calls the bitstamp ticker api' do
      expect(Net::HTTP).to receive(:get).and_return("{\"fake\": \"data\"}")

      Bitstamp.ticker
    end

    it 'returns a hash of the JSON returned' do
      api_response = %Q{
        { \"high\": \"442.36\", \"last\": \"436.98\",
          \"timestamp\": \"1399220089\", \"bid\": \"436.98\",
          \"vwap\": \"434.97\", \"volume\": \"6648.31055004\",
          \"low\": \"429.55\", \"ask\": \"437.00\"}
      }
      allow(Net::HTTP).to receive(:get).and_return(api_response)

      expect(Bitstamp.ticker).to eql JSON.parse(api_response)
    end
  end
end

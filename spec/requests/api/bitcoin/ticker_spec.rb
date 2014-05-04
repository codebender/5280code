require 'spec_helper'

describe 'Bitcoin::TickerController API' do
  describe 'GET /api/bitcoin/ticker' do
    it 'returns the fitbit activity data' do
      ticker_response = { 'high' => '455.78', 'last' => '437.01',
      'timestamp' => '1399149858', 'bid' => '436.77', 'vwap' => '442.15',
      'volume' => '7667.02426861', 'low' => '431.00', 'ask' => '437.01'}
      expect(Bitstamp).to receive(:ticker).and_return(ticker_response)

      get '/api/bitcoin/ticker'

      expect(response).to be_success
      expect(json['high']).to eql '455.78'
      expect(json['low']).to eql '431.00'
      expect(json['last']).to eql '437.01'
      expect(json['timestamp']).to eql '1399149858'
     end
  end
end

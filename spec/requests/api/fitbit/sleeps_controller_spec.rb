require 'spec_helper'

describe 'Fitbit::SleepsController API' do
  describe 'GET /api/fitbit/sleep' do
    it 'returns the fitbit sleep info' do
      sleep_data = double(Fitbit::SleepData)
      allow(sleep_data).to receive(:minutes_in_bed).and_return(548)
      allow(sleep_data).to receive(:minutes_asleep).and_return(510)
      allow(sleep_data).to receive(:minutes_to_fall_asleep).and_return(10)
      allow(sleep_data).to receive(:efficiency).and_return(98)
      allow(Fitbit::Service).to receive(:get_sleep_data).and_return(sleep_data)

      get '/api/fitbit/sleep'

      expect(response).to be_success
      expect(json['minutes_in_bed']).to eql 548
      expect(json['minutes_asleep']).to eql 510
      expect(json['minutes_to_fall_asleep']).to eql 10
      expect(json['efficiency']).to eql 98
     end
  end
end

require 'spec_helper'

describe 'Fitbit::SleepsController API' do
  describe 'GET /api/fitbit/sleep' do
    it 'returns the fitbit sleep info' do
      allow_any_instance_of(Fitbit::SleepData).to receive(:get_data).
        and_return({
          'timeInBed' => 548,
          'minutesAsleep' => 510,
          'minutesToFallAsleep' => 10,
          'efficiency' => 98
        })

      get '/api/fitbit/sleep'

      expect(response).to be_success
      expect(json['minutes_in_bed']).to eql 548
      expect(json['minutes_asleep']).to eql 510
      expect(json['minutes_to_fall_asleep']).to eql 10
      expect(json['efficiency']).to eql 98
    end
  end

  describe 'GET /api/fitbit/sleep/:time_frame' do
    let(:double) { instance_double(Fitbit::TimeSeries::MinutesAsleep) }
    let(:sleep_data) {
      {
        "2015-03-07" => "430",
        "2015-03-08" => "414",
        "2015-03-09" => "462",
        "2015-03-10" => "378",
        "2015-03-11" => "501",
        "2015-03-12" => "358",
        "2015-03-13" => "444"
      }
    }

    it 'returns json for the requested time frame' do
      expect(Fitbit::TimeSeries::MinutesAsleep).to receive(:new).with('1w').
        and_return(double)
      expect(double).to receive(:get_data).and_return(sleep_data)

      get '/api/fitbit/sleep/1w'

      expect(response).to be_success
      expect(response.body).to eql sleep_data.to_json
    end
  end
end

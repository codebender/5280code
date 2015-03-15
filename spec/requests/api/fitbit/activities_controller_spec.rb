require 'spec_helper'

describe 'Fitbit::ActivitiesController API' do
  describe 'GET /api/fitbit/activity' do
    it 'returns the fitbit activity data' do
      activity_data = double(Fitbit::ActivityData)
      allow(activity_data).to receive(:steps).and_return(12345)
      allow(activity_data).to receive(:calories_out).and_return(2944)
      allow(activity_data).to receive(:active_calories).and_return(748)
      allow(activity_data).to receive(:distance).and_return(5.34)
      allow(activity_data).to receive(:active_minutes).and_return(68)
      allow(Fitbit::Service).to receive(:get_activity_data).
        and_return(activity_data)

      get '/api/fitbit/activity'

      expect(response).to be_success
      expect(json['steps']).to eql 12345
      expect(json['calories_out']).to eql 2944
      expect(json['active_calories']).to eql 748
      expect(json['distance']).to eql 5.34
      expect(json['active_minutes']).to eql 68
     end
  end

  describe 'GET /api/fitbit/activity/:time_frame' do
    let(:double) { instance_double(Fitbit::TimeSeries::Steps) }
    let(:step_data) {
      {
        "2015-03-07" => "10418",
        "2015-03-08" => "19844",
        "2015-03-09" => "15061",
        "2015-03-10" => "10289",
        "2015-03-11" => "13754",
        "2015-03-12" => "10476",
        "2015-03-13" => "10773"
      }
    }

    it 'returns json for the requested time frame' do
      expect(Fitbit::TimeSeries::Steps).to receive(:new).with('1w').
        and_return(double)
      expect(double).to receive(:get_data).and_return(step_data)

      get '/api/fitbit/activity/1w'

      expect(response).to be_success
      expect(response.body).to eql step_data.to_json
    end
  end
end

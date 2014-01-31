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
end

require 'spec_helper'

describe 'Fitbit::UsersController API' do
  describe 'GET /api/fitbit/user' do
    it 'returns the fitbit user info' do
      allow_any_instance_of(Fitbit::UserInfo).to receive(:get_data).
        and_return({
          'memberSince' => Date.today,
          'avatar150' => 'http://www.fitbit.com/default_male.gif',
          'city' => 'San Francisco',
          'state' => 'CA',
          'height' => 76.75,
          'weight' => 176.75,
          'bmi' => 21.09
        })

      get '/api/fitbit/user'

      expect(response).to be_success
      expect(json['member_since']).to eql Date.today.to_s
      expect(json['avatar_url']).to eql 'http://www.fitbit.com/default_male.gif'
      expect(json['city']).to eql 'San Francisco'
      expect(json['state']).to eql 'CA'
      expect(json['height']).to eql 76.75
      expect(json['weight']).to eql 176.75
      expect(json['bmi']).to eql 21.09
    end
  end
end

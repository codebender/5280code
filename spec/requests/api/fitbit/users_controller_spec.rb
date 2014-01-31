require 'spec_helper'

describe 'Fitbit::UsersController API' do
  describe 'GET /api/fitbit/user' do
    it 'returns the fitbit user info' do
      user_info = double(Fitbit::UserInfo)
      allow(user_info).to receive(:member_since).and_return(Date.today)
      allow(user_info).to receive(:avatar_url).
        and_return('http://www.fitbit.com/default_male.gif')
      allow(user_info).to receive(:city).and_return('San Francisco')
      allow(user_info).to receive(:state).and_return('CA')
      allow(user_info).to receive(:height).and_return(76.75)
      allow(user_info).to receive(:weight).and_return(176.75)
      allow(Fitbit::Service).to receive(:get_user_info).and_return(user_info)

      get '/api/fitbit/user'

      expect(response).to be_success
      expect(json['member_since']).to eql Date.today.to_s
      expect(json['avatar_url']).to eql 'http://www.fitbit.com/default_male.gif'
      expect(json['city']).to eql 'San Francisco'
      expect(json['state']).to eql 'CA'
      expect(json['height']).to eql 76.75
      expect(json['weight']).to eql 176.75
    end
  end
end

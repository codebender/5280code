require 'spec_helper'

describe Fitbit::UserInfo do
  let(:user_hash) do
    {
     "user" => {
        "aboutMe" => "I live in San Francisco.",
        "avatar" => "http://www.fitbit.com/defaultProfile_100_male.gif",
        "avatar150" => "http://www.fitbit.com/defaultProfile_150_male.gif",
        "city" => "San Francisco",
        "country" => "US",
        "dateOfBirth" => "1970-02-18",
        "displayName" => "Fitbit U.",
        "distanceUnit" => "METRIC",
        "encodedId" => "257V3V",
        "fullName" => "Fitbit User",
        "gender" => "MALE",
        "glucoseUnit" => "METRIC",
        "height" => 76.75,
        "heightUnit" => "US",
        "nickname" => "",
        "locale" => "en_GB",
        "memberSince" => "2010-02-07",
        "offsetFromUTCMillis" => -25200000,
        "state" => "CA",
        "strideLengthRunning" => 0,
        "strideLengthWalking" => 0,
        "timezone" => "America/Los_Angeles",
        "waterUnit" => "METRIC",
        "weight" => 160.55,
        "weightUnit" => "US"
        }
      }
  end

  describe 'get_data' do
    it 'calls the client to get the sleep data' do
      expect_any_instance_of(Fitgem::Client).to receive(:user_info).
        and_return(user_hash)

      Fitbit::UserInfo.new.get_data
    end
  end

  describe 'parse_api_data' do
    it 'parses the returns api hash args' do
      user_info = Fitbit::UserInfo.new.parse_api_data(user_hash)
      expect(user_info['memberSince']).to eql '2010-02-07'
      expect(user_info['avatar150']).
        to eql 'http://www.fitbit.com/defaultProfile_150_male.gif'
      expect(user_info['city']).to eql 'San Francisco'
      expect(user_info['state']).to eql 'CA'
      expect(user_info['height']).to eql 76.75
      expect(user_info['weight']).to eql 160.55
    end

    it 'calculates the users BMI from the height and weight' do
      user_info = Fitbit::UserInfo.new.parse_api_data(user_hash)
      expect(user_info['bmi']).to eql ((160.55/(76.75*76.75))*703).round(2)
    end
  end
end

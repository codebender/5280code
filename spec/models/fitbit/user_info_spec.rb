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

  describe 'initialize' do
    it 'parses the returns api hash args' do
      user_info = Fitbit::UserInfo.new(user_hash)
      user_info.member_since.should eql Date.parse('2010-02-07')
      user_info.avatar_url.should eql 'http://www.fitbit.com/defaultProfile_150_male.gif'
      user_info.city.should eql 'San Francisco'
      user_info.state.should eql 'CA'
      user_info.height.should eql 76.75
      user_info.weight.should eql 160.55
    end
  end

  describe 'bmi' do
    it 'calculates the users BMI from the height and weight' do
      user_info = Fitbit::UserInfo.new(user_hash)
      user_info.bmi.should eql ((160.55/(76.75*76.75))*703).round(2)
    end
  end
end

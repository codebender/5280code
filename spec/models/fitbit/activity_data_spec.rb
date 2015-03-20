require 'spec_helper'

describe Fitbit::ActivityData do
  let(:activity) do
    {
      "activities" => [
        {
          "activityId" => 51007,
          "activityParentId" => 90019,
          "calories" => 230,
          "description" => "7mph",
          "distance" => 2.04,
          "duration" => 1097053,
          "hasStartTime" => true,
          "isFavorite" => true,
          "logId" => 1154701,
          "name" => "Treadmill, 0% Incline",
          "startTime" => "00:25",
          "steps" => 3783
        }
      ],
      "goals" => {
        "caloriesOut" => 2826,
        "distance" => 8.05,
        "floors" => 150,
        "steps" => 10000
       },
      "summary" => {
        "activityCalories" => 230,
        "caloriesBMR" => 1913,
        "caloriesOut" => 2143,
        "distances" => [
          {"activity" => "tracker", "distance" => 1.32},
          {"activity" => "loggedActivities", "distance" => 0},
          {"activity" => "total","distance" => 1.32},
          {"activity" => "veryActive", "distance" => 0.51},
          {"activity" => "moderatelyActive", "distance" => 0.51},
          {"activity" => "lightlyActive", "distance" => 0.51},
          {"activity" => "sedentaryActive", "distance" => 0.51},
          {"activity" => "Treadmill, 0% Incline", "distance" => 3.28}
        ],
        "elevation" => 48.77,
        "fairlyActiveMinutes" => 10,
        "floors" => 16,
        "lightlyActiveMinutes" => 20,
        "marginalCalories" => 200,
        "sedentaryMinutes" => 1166,
        "steps" => 1234,
        "veryActiveMinutes" => 30
      }
    }
  end

  describe 'get_data' do
    it 'calls the client to get the activity data' do
      expect_any_instance_of(Fitgem::Client).to receive(:activities_on_date).
        and_return(activity)

      Fitbit::ActivityData.new.get_data
    end
  end

  describe 'parse_api_data' do
    it 'parses the returns api hash args' do
      parsed_data = Fitbit::ActivityData.new.parse_api_data(activity)
      expect(parsed_data['steps']).to eql 1234
      expect(parsed_data['distance']).to eql 1.32
      expect(parsed_data['caloriesOut']).to eql 2143
      expect(parsed_data['activityCalories']).to eql 230
      expect(parsed_data['veryActiveMinutes']).to eql 30
    end
  end
end

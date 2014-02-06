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

  describe 'initialize' do
    it 'parses the returns api hash args' do
      activity_data = Fitbit::ActivityData.new(activity)
      activity_data.steps.should eql 1234
      activity_data.distance.should eql 1.32
      activity_data.calories_out.should eql 2143
      activity_data.active_calories.should eql 230
      activity_data.active_minutes.should eql 60
    end
  end
end

require 'spec_helper'

describe Fitbit::SleepData do
  let(:sleep_data) do
    {
      "sleep" => [
        {
          "isMainSleep" => true,
          "logId" => 29744,
          "efficiency" => 98,
          "startTime" => "2011-06-16T00:00:00.000",
          "duration" => 28800000,
          "minutesToFallAsleep" => 10,
          "minutesAsleep" => 480,
          "minutesAwake" => 0,
          "minutesAfterWakeup" => 0,
          "awakeningsCount" => 0,
          "timeInBed" => 490,
          "minuteData" => [
            {
                "dateTime" => "00:00:00",
                "value" => "3"
            },
            {
                "dateTime" => "00:01:00",
                "value" => "2"
            },
            {
                "dateTime" => "00:02:00",
                "value" => "1"
            }]
        },
        {
            "isMainSleep" => false,
            "logId" => 29745,
            "efficiency" => 93,
            "startTime" => "2011-06-16T14:00:00.000",
            "duration" => 3600000,
            "minutesToFallAsleep" => 20,
            "minutesAsleep" => 38,
            "minutesAwake" => 0,
            "minutesAfterWakeup" => 2,
            "awakeningsCount" => 0,
            "timeInBed" => 60,
            "minuteData" => [
                {
                    "dateTime" => "14:00:00",
                    "value" => "3"
                }]
        }
    ],
    "summary" => {
        "totalMinutesAsleep" => 518,
        "totalSleepRecords" => 2,
        "totalTimeInBed" => 540
      }
    }
  end

  describe 'initialize' do
    it 'parses the returns api hash args' do
      sleep = Fitbit::SleepData.new(sleep_data)
      expect(sleep.minutes_asleep).to eql 480
      expect(sleep.minutes_in_bed).to eql 490
      expect(sleep.minutes_to_fall_asleep).to eql 10
      expect(sleep.efficiency).to eql 98
    end
  end
end

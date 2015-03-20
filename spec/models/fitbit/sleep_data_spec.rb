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

  describe 'get_data' do
    it 'calls the client to get the sleep data' do
      expect_any_instance_of(Fitgem::Client).to receive(:sleep_on_date).
        and_return(sleep_data)

      Fitbit::SleepData.new.get_data
    end
  end

  describe 'parse_api_data' do
    it 'parses the returns api hash args' do
      parsed_data = Fitbit::SleepData.new.parse_api_data(sleep_data)
      expect(parsed_data['minutesAsleep']).to eql 480
      expect(parsed_data['timeInBed']).to eql 490
      expect(parsed_data['minutesToFallAsleep']).to eql 10
      expect(parsed_data['efficiency']).to eql 98
    end

    it 'handles when no sleep data is returned' do
      expect{ Fitbit::SleepData.new.parse_api_data({"sleep"=>[],
        "summary"=>{
          "totalMinutesAsleep"=>0, "totalSleepRecords"=>0, "totalTimeInBed"=>0}}
        )
      }.not_to raise_error
    end
  end
end

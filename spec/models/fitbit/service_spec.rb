require 'spec_helper'

describe Fitbit::Service do
  context 'Class Methods:' do
    let(:client) do
      Fitgem::Client.new(
        consumer_key: 'fake_key',
        consumer_secret: 'fake_secret',
        token: 'fake_token',
        secret: 'fake_secret'
      )
    end

    before(:each) do
      allow(Fitbit::Service).to receive(:client).and_return(client)
    end

    describe 'get_user_info' do
      it 'calls the fitbit api endpoint user_info with the client' do
        allow(Fitbit::UserInfo).to receive(:new)
        expect(client).to receive(:user_info)

        Fitbit::Service.get_user_info
      end

      it 'returns a UserInfo object that parses the returned api data' do
        user_info_mock = double(Fitbit::UserInfo)
        allow(client).to receive(:user_info)

        expect(Fitbit::UserInfo).to receive(:new).and_return(user_info_mock)

        user_info = Fitbit::Service.get_user_info
        user_info.should eql user_info_mock
      end
    end

    describe 'get_sleep_data' do
      it 'calls the fitbit api endpoint sleep with the client' do
        allow(Fitbit::SleepData).to receive(:new)

        expect(client).to receive(:sleep_on_date).
          with(Time.now.in_time_zone('Mountain Time (US & Canada)').to_date)

        Fitbit::Service.get_sleep_data
      end

      it 'returns a SleepData object that parses the returned api data' do
        allow(client).to receive(:sleep_on_date)
        sleep_data_mock = double(Fitbit::SleepData)

        expect(Fitbit::SleepData).to receive(:new).and_return(sleep_data_mock)

        sleep_data = Fitbit::Service.get_sleep_data
        sleep_data.should eql sleep_data_mock
      end
    end

    describe 'get_device_info' do
      it 'calls the fitbit api endpoint devices with the client' do
        allow(Fitbit::DeviceInfo).to receive(:new)

        expect(client).to receive(:devices)

        Fitbit::Service.get_device_info
      end

      it 'returns a DeviceInfo object that parses the returned api data' do
        allow(client).to receive(:devices)
        device_info_mock = double(Fitbit::DeviceInfo)

        expect(Fitbit::DeviceInfo).to receive(:new).and_return(device_info_mock)

        device_info = Fitbit::Service.get_device_info
        device_info.should eql device_info_mock
      end
    end

    describe 'get_activity_data' do
      it 'calls the fitbit api endpoint activities with the client' do
        allow(Fitbit::ActivityData).to receive(:new)

        expect(client).to receive(:activities_on_date).
          with(Time.now.in_time_zone('Mountain Time (US & Canada)').to_date)

        Fitbit::Service.get_activity_data
      end

      it 'returns a ActivityData object that parses the returned api data' do
        allow(client).to receive(:activities_on_date)
        activity_data_mock = double(Fitbit::ActivityData)

        expect(Fitbit::ActivityData).to receive(:new).and_return(activity_data_mock)

        activity_data = Fitbit::Service.get_activity_data
        activity_data.should eql activity_data_mock
      end
    end
  end
end

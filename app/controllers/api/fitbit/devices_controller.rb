class Api::Fitbit::DevicesController < Api::BaseController

  def show
    @device_info = fitbit_device_info
  end

  private

  def fitbit_device_info
    Rails.cache.fetch('fitbit_device_info', expires_in: 1.minute) do
      ::Fitbit::DeviceInfo.new.get_data
    end
  end
end

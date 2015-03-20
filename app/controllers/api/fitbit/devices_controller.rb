class Api::Fitbit::DevicesController < Api::BaseController

  def show
    @device_info = ::Fitbit::DeviceInfo.new.get_data
  end
end

class Api::Fitbit::DevicesController < Api::BaseController

  def show
    @device_info = ::Fitbit::Service.get_device_info
  end
end

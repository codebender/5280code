class Api::Fitbit::DevicesController < ApplicationController
  respond_to :json

  def show
    @device_info = ::Fitbit::Service.get_device_info
  end
end

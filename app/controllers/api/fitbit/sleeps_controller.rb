class Api::Fitbit::SleepsController < ApplicationController
  respond_to :json

  def show
    @sleep_data = ::Fitbit::Service.get_sleep_data
  end
end

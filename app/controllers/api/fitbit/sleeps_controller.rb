class Api::Fitbit::SleepsController < Api::BaseController

  def show
    @sleep_data = ::Fitbit::Service.get_sleep_data
  end
end

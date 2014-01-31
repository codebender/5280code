class Api::Fitbit::ActivitiesController < ApplicationController
  respond_to :json

  def show
    @activity_data = ::Fitbit::Service.get_activity_data
  end
end

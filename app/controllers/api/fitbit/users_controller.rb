class Api::Fitbit::UsersController < ApplicationController
  respond_to :json

  def show
    @user_info = ::Fitbit::Service.get_user_info
  end
end

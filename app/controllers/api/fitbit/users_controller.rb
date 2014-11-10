class Api::Fitbit::UsersController < Api::BaseController

  def show
    @user_info = ::Fitbit::Service.get_user_info
  end
end

class Api::Fitbit::UsersController < Api::BaseController

  def show
    @user_info = ::Fitbit::UserInfo.new.get_data
  end
end

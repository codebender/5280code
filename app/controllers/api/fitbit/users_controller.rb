class Api::Fitbit::UsersController < Api::BaseController

  def show
    @user_info = fitbit_user_info
  end

  private

  def fitbit_user_info
    Rails.cache.fetch('fitbit_user_info', expires_in: 1.hour) do
      ::Fitbit::UserInfo.new.get_data
    end
  end
end

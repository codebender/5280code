module Fitbit::Client

  private

  def client
    @client ||= Fitgem::Client.new(
                  consumer_key: ENV["FITBIT_CONSUMER_KEY"],
                  consumer_secret: ENV["FITBIT_CONSUMER_SECRET"],
                  token: ENV["FITBIT_TOKEN"],
                  secret: ENV["FITBIT_SECRET"]
              )
  end

  def today
    Time.now.in_time_zone('Mountain Time (US & Canada)').to_date
  end
end

module Fitbit
  class UserInfo
    include Fitbit::Client

    # https://wiki.fitbit.com/display/API/API-Get-User-Info
    def get_data
      raw_data = client.user_info
      parse_api_data(raw_data)
    end

    def parse_api_data(raw_data)
      parsed = raw_data['user'].slice('memberSince', 'avatar150', 'city',
        'state', 'height', 'weight')
      parsed['bmi'] = bmi(parsed['height'], parsed['weight'])
      parsed
    end

    private

    def bmi(height, weight)
      (weight/(height*height)*703).round(2)
    end
  end
end

module Fitbit
  class UserInfo
    attr_reader :member_since,
                :avatar_url,
                :city,
                :state,
                :time_zone,
                :height,
                :weight

    def initialize(args)
      @member_since = Date.parse(args['user']['memberSince'])
      @avatar_url = args['user']['avatar150']
      @city = args['user']['city']
      @state = args['user']['state']
      @height = args['user']['height']
      @weight = args['user']['weight']
    end

    def bmi
      (weight/(height*height)*703).round(2)
    end
  end
end

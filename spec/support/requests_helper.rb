module Requests
  module ApiHelper
    def json
      @json ||= JSON.parse(response.body)
    end
  end
end

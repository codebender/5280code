class Api::MeetupsController < Api::BaseController

  def index
    meetup_response =  MeetupApi.new.method_request(:events,
      { status: 'upcoming', format: 'json', page: 5,
        member_id: ENV['MEETUP_MEMBER_ID'] })

    respond_with meetup_response.except('meta')
  end
end

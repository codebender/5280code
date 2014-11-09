class Api::MeetupsController < Api::BaseController

  def index
    respond_with MeetupApi.new.method_request(:events,
      { status: 'upcoming', format: 'json', page: 5,
        member_id: ENV['MEETUP_MEMBER_ID'] })
  end
end

require 'spec_helper'

describe 'Meetups API' do
  it 'returns a last of meetup.com meetup events' do
    expect_any_instance_of(MeetupApi).to receive(:method_request).
      with(:events, { status: 'upcoming', format: 'json', page: 5,
        member_id: ENV['MEETUP_MEMBER_ID'] })


    get '/api/meetups'
  end
end

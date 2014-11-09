require 'spec_helper'

describe 'Meetups API' do
  it 'returns a last of meetup.com meetup events' do
    expect_any_instance_of(MeetupApi).to receive(:method_request).
      with(:events, { status: 'upcoming', format: 'json', page: 5,
        member_id: ENV['MEETUP_MEMBER_ID'] }).and_return( 'results' => [] )


    get '/api/meetups'
  end

  it 'removes the meta secret data from the Meetup api response' do
    allow_any_instance_of(MeetupApi).to receive(:method_request).and_return(
      { 'results' => [ blah: 'fake' ], 'meta' => { top: 'secret' } }
    )

    get '/api/meetups'

    expect(json['meta']).to be_nil
  end
end

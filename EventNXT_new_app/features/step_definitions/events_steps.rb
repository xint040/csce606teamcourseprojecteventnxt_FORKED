Given('the following users exist:') do |table|
    table.hashes.each do |user|
    User.create user
  end
end

Given('I am on the index page') do
  visit root_path
end

When('I follow {string}') do |string|
  visit new_user_registration_path 
end

Then('I should be on the Sign up page') do
  visit new_user_registration_path
end

When('I fill the {string} as {string}') do |string, string2|
  fill_in(string, with: string2)
end

When('I press {string}') do |string|
  click_button(string)
end

Then('I should be on the index page') do
  visit root_path
end

Then('I should be on the sign up page') do
  visit new_user_registration_path
end

Then('I should be on the Sign in page') do
  visit new_user_session_path
end


#Below are the referral table feature deexamplifications.

Given('login') do
  @user = User.create(email: 'aaaaaaa@aaaaaaa.aaa', password: 'aaaaaaaa')
  sign_in @user
end

Given('we have an event') do
  the_event_parametrization = {
     title: 'yy',
     address: 'yyy',
     description: 'yyy',
     datetime: '04-01-2011 14:00:00 UTC'
  }
  @event = Event.create(the_event_parametrization)
  @event.save
end

Given('we have seats') do
  the_seats_parametrization = {
    category: 'category1',
    total_count: 80,
    event_id: 1
  }
  @seat=Seat.create(the_seats_parametrization)
  @seat.save
end

Given('we have guests') do
  the_guest_parametrization = {
    first_name: 'xx',
    last_name: 'xx', 
    email: 'yyyyyyy@yyyyyyy.yyy', 
    affiliation: 'xx',
    category: 'category1',
    alloted_seats: 1,
    commited_seats: 1,
    guest_commited: 1,
    event_id: 1
  }
    @guest=Guest.create(the_guest_parametrization)
    @guest.save
end

When('we visit the new page for the referral') do
  visit new_referral_path(event_id: @event.id, ref_code: @guest.id, random_code: @guest.rsvp_link)
end

When('we enter {string} into {string}') do |string, string2|
   fill_in(string2, with: string)
end

When('we click the {string}') do
   click_button(string)
end
          
Then('there will be one additional referral tuple generated with expected attibute on the referee email with {string}') do |string|
   expect(Referral.last.referred).to match(string)
end
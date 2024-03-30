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

Given('we have a referral') do
  the_referral_parametrization = {
    email: 'yyyyyyy@yyyyyyy.yyy',
    name: 'xx xx', 
    referred: 'zzzzzzz@zzzzzzz.zzz', 
    status: true,
    tickets: 3,
    amount: 150,
    reward_method: 'reward/ticket',
    reward_input: 0,
    reward_value: 0,
    ref_code: 1,
    event_id: 1,
    guest_id: 1
    }
    @referral = Referral.create(the_referral_parametrization)
    @referral.save
end
          
When('we go to the event show page') do
    visit event_path(@event)
end

When('we click the {string} link for the referral we see there') do
    click_link(string) 
end  

Then('we are on the edit referral page') do
    visit modify_the_referral_path(event_id: @event.id, id: @referral.id)
end

When('we enter the {string} into {string}') do |string, string2|
    fill_in(string2, with: string)
end

When('we click the {string} button')
    click_button(string)
end

Then('the reward will be updated to accurate value') do
    expect(@referral.reward_value).to eq(params[:reward_input] * (@referral.reward_value))
end
          
Given('we have a ticket information') do
  the_ticket_parametrization = {
    ticket_quanty: 3,
    ticket_amount: 150,
    ticket_referee: 'zzzzzzz@zzzzzzz.zzz',
    ticket_status: ture,
    event_id: @event.id
    referral_id: @referral.id
    }
    @ticket = Ticket.create(the_ticket_parametrization)
    @ticket.save
end

Then('the referral table tickets values will be directly equal to the values on the ticket information') do
    expect(@referral.tickets).to eq(3)
    expect(@referral.status).to match(true)
    expect(@referral.referred).to match('zzzzzzz@zzzzzzz.zzz') 
end

Given('we have a ticket information now from the box office sale information directly') do
  the_box_office_parametrization = {
    guest_email: 'yyyyyyy@yyyyyyy.yyy', 
    ticket_quanty: 3,
    ticket_amount: 150,
    ticket_referee: 'zzzzzzz@zzzzzzz.zzz',
    ticket_status: ture,
    event_id: @event.id
    }
    @box_office_data_tuple = BoxOfficeData.create(the_box_office_parametrization)
    @box_office_data_tuple.save
end

Then('similarly the referral table tickets values will be directly equal to the values on the ticket information') do
    expect(@referral.tickets).to eq(3)
    expect(@referral.status).to match(true)
    expect(@referral.referred).to match('zzzzzzz@zzzzzzz.zzz') 
end
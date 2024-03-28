require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    describe 'ticket purchase updated' do
      let(:event) { create(:event, user: user) }
      let(:seat) { create(:seat, event: event) }
      let(:guest) { create(:guest, event: event) }  
      it 'ticket information will be updated according to the input of the referee' do
            the_referral_parametrization = {
              email: guest.email,
              name: '#{guest.first_name} #{guest.last_name}', 
              referred: 'zzzzzzz@zzzzzzz.zzz', 
              status: false,
              tickets: 0,
              amount: 0,
              reward_method: 'reward/ticket',
              reward_input: 0,
              reward_value: 0,
              guest_id: guest.id
              ref_code: guest.id
              }
            @referral = Referral.create(the_referral_parametrization)
            @referral.save
            post new_ticket_purchase_path, params: {referral_id: @referral.id, ticket_quantity: 10}
            expect(@referral.tickets).to eq(10)
      end

      it 'ticket information will be updated according to the box office data' do
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
        expect(@referral.tickets).to eq(3)
        expect(@referral.status).to match(true)
        expect(@referral.referred).to match('zzzzzzz@zzzzzzz.zzz')
      end
    end
end
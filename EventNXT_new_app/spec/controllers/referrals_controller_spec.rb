require 'rails_helper'

RSpec.describe ReferralsController, type: :controller do
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    describe 'create method for referral after the friend email sent' do
      let(:event) { create(:event, user: user) }
      let(:seat) { create(:seat, event: event) }
      let(:guest) { create(:guest, event: event) }
      let(:friend_email) { 'aaaaaaa@aaaaaaa.???' }
      it 'then we will have a new referral created' do    
  
                        
#           doublization_of_the_email_delivery = double('delivery of the email')
#           expect(UserMailer).to receive(:referral_confirmation).and_return(doublization_of_the_email_delivery)
#            expect{post create_referrall_path, params: {guest_id: guest.id, friend_email: aaaaaaa@aaaaaaa.???}}.to change(Referral, :count).by(1)
            
      end
    end

    describe 'update method for referral after we have a referral' do
      let(:event) { create(:event, user: user) }
      let(:seat) { create(:seat, event: event) }
      let(:guest) { create(:guest, event: event) }
      it 'then we will have reward updated' do
            the_referral_parametrization = {
              email: guest.email,
              name: '#{guest.first_name} #{guest.last_name}', 
              referred: 'aaaaaaa@aaaaaaa.aaa', 
              status: true,
              tickets: 3,
              amount: 150,
              reward_method: 'reward/ticket',
              reward_input: 0,
              reward_value: 0,
              guest_id: guest.id
              }
            @referral = Referral.create(the_referral_parametrization)
            @referral.save
           
            put modify_the_referral_path, params: {guest_id: guest.id, id: @referral.id, reward_input: 10}
            expect(@referral.reward_value).to eq(30)           
      end
    end
end
# spec/controllers/referrals_controller_spec.rb
require 'rails_helper'

RSpec.describe ReferralsController, type: :controller do
  describe 'POST #create' do
    it 'sends a referral email and responds with no content' do
      expect(UserMailer).to receive_message_chain(:referral_confirmation, :deliver_now)

      post :create, params: { friend_email: 'friend@example.com' }

      expect(response).to have_http_status(:no_content)
    end
  end
end
# require 'rails_helper'

# RSpec.describe ApplicationController, type: :controller do
#   describe 'authentication' do
#     controller do
#       def index
#         render plain: 'Hello, world!'
#       end
#     end

#     context 'when user is not signed in' do
#       it 'redirects to the sign-in page' do
#         get :index
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end

#     context 'when user is signed in' do
#       let(:user) { create(:user) }

#       before { sign_in user }

#       it 'renders the page' do
#         get :index
#         expect(response).to be_successful
#         expect(response.body).to eq('Hello, world!')
#       end
#     end
#   end
# end

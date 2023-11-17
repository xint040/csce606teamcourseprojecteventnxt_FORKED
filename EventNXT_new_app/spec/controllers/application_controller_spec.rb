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
#
# spec/controllers/application_controller_spec.rb
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'after_sign_in_path_for' do
    context 'when the resource is a user' do
      let(:user) { create(:user) } # Assuming you have a User factory

      it 'redirects to the events_path' do
        allow(controller).to receive(:resource).and_return(user)
        path = controller.after_sign_in_path_for(user)
        expect(path).to eq(events_path)
      end
    end

    context 'when the resource is not a user' do
      let(:resource) { double('Resource') }

      it 'calls the super method' do
        allow(controller).to receive(:resource).and_return(resource)
        expect(controller.after_sign_in_path_for(resource)).to eq(super())
      end
    end
  end
end


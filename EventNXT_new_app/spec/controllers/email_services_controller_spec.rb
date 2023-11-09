require 'rails_helper'

RSpec.describe EmailServicesController, type: :controller do
    let(:user) { create(:user) }
    before do
        sign_in user # Sign in the user before running the tests
    end
  let(:valid_attributes) do
    {
      to: 'user@example.com',
      subject: 'Test Email',
      body: 'This is a test email'
    }
  end

  before do
    @email_service = EmailService.create!(valid_attributes) # Create a valid EmailService record
  end

  let(:invalid_attributes) do
    {
      to: '',
      subject: '',
      body: ''
    }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      #puts ("------------------------------")
      expect(response).to be_successful
      #expect(response).to render_template(:index)
      #expect(response.body).to include("Unsent Email")
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      #puts ("&&&&&&&&&&&&&&&&&")
      #puts (@email_service)
      #puts ("&&&&&&&&&&&&&&&&&")
      get :show, params: { id: @email_service.id }
      expect(response).to be_successful
      
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      email_service = EmailService.create! valid_attributes
      get :edit, params: { id: email_service.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new EmailService' do
        expect do
          post :create, params: { email_service: valid_attributes }
        end.to change(EmailService, :count).by(1)
      end

      it 'redirects to the created email_service' do
        post :create, params: { email_service: valid_attributes }
        expect(response).to redirect_to(EmailService.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { email_service: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          to: 'updated@example.com',
          subject: 'Updated Test Email',
          body: 'This is an updated test email'
        }
      end

      it 'updates the requested email_service' do
        email_service = EmailService.create! valid_attributes
        put :update, params: { id: email_service.to_param, email_service: new_attributes }
        email_service.reload
        expect(email_service.to).to eq(new_attributes[:to])
        expect(email_service.subject).to eq(new_attributes[:subject])
        expect(email_service.body).to eq(new_attributes[:body])
      end

      it 'redirects to the email_service' do
        email_service = EmailService.create! valid_attributes
        put :update, params: { id: email_service.to_param, email_service: valid_attributes }
        expect(response).to redirect_to(email_service)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        email_service = EmailService.create! valid_attributes
        put :update, params: { id: email_service.to_param, email_service: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end
end

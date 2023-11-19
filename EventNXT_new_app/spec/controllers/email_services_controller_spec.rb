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
      expect(response).to be_successful
      #expect(response).to render_template(:index)
      #expect(response.body).to include("Unsent Email")
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
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
        #expect(response).to render_template(:new)
        #expect(response).to have_http_status(:unprocessable_entity)
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

  describe 'DELETE #destroy' do
    it 'destroys the email service' do
      email_service = EmailService.create! valid_attributes

      expect {
        delete :destroy, params: { id: email_service.to_param }
      }.to change(EmailService, :count).by(-1)

      #expect(response).to redirect_to(email_service)
      expect(flash[:notice]).to eq('Email service was successfully destroyed.')
    end
  end

  describe 'POST #add_template' do
    let(:valid_template_params) { attributes_for(:email_template) } # Assuming you have a factory for EmailTemplate

    context 'with valid template parameters' do
      it 'creates a new email template' do
        expect {
          post :add_template, params: { email_template: valid_template_params }
        }.to change(EmailTemplate, :count).by(1)

      end
    end

    context 'with invalid template parameters' do
      let(:invalid_template_params) { { name: '', subject: '', body: '' } }

      it 'does not create a new email template' do
        expect {
          post :add_template, params: { email_template: invalid_template_params }
        }.not_to change(EmailTemplate, :count)

      end
    end
  end

  describe "#send_email" do

    let(:email_service) { create(:email_service) }
    let(:event) { create(:event) }
    let(:guest) { create(:guest) }

    before do
      allow(EmailService).to receive(:find).and_return(email_service)
      allow(Event).to receive(:find).and_return(event)
      allow(Guest).to receive(:find).and_return(guest)
    end

    # it "sends an email and updates the email service" do
    #   expect(ApplicationMailer).to receive(:send_email)
    #     .with(email_service.to, email_service.subject, email_service.body, event, guest, /book_seats/)

    #   expect { post :send_email, params: { id: email_service.id } }.to change { ActionMailer::Base.deliveries.count }.by(1)

    #   expect(flash[:success]).to eq('Email sent!')
    #   expect(email_service.reload.sent_at).to be_present
    #   expect(response).to redirect_to(email_services_url)
    # end

    it "sends an email and updates the email service" do
      allow(ApplicationMailer).to receive_message_chain(:send_email, :deliver_later)

      initial_count = ActionMailer::Base.deliveries.count

      expect do
        post :send_email, params: { id: email_service.id }
      end.to change { ActionMailer::Base.deliveries.count }.from(initial_count).to(initial_count + 1)

      # Rest of your expectations...
    end
  end

end


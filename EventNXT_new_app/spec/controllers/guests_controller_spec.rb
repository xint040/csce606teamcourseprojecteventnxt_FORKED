require 'rails_helper'

RSpec.describe GuestsController, type: :controller do
  # Create a parent event to associate with guests
  let(:event) { create(:event) }
  let(:user) { create(:user) } # Create a user for authentication
  before do
    sign_in user # Sign in the user before running the tests
  end
  let(:valid_attributes) { attributes_for(:guest, event_id: event.id) }
  let(:invalid_attributes) { attributes_for(:guest, first_name: nil, event_id: event.id) }


  describe "GET #index" do
    it "assigns all guests of the event as @guests" do
      guest1 = create(:guest, event: event)
      guest2 = create(:guest, event: event)
      get :index, params: { event_id: event.to_param }
      expect(assigns(:guests)).to eq([guest1, guest2])
    end

    it "renders the :index template" do
      get :index, params: { event_id: event.to_param }
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested guest as @guest" do
      guest = create(:guest, event: event)
      get :show, params: { event_id: event.to_param, id: guest.to_param }
      expect(assigns(:guest)).to eq(guest)
    end

    it "renders the :show template" do
      guest = create(:guest, event: event)
      get :show, params: { event_id: event.to_param, id: guest.to_param }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new guest as @guest" do
      get :new, params: { event_id: event.to_param }
      expect(assigns(:guest)).to be_a_new(Guest)
    end

    it "renders the :new template" do
      get :new, params: { event_id: event.to_param }
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "assigns the requested guest as @guest" do
      guest = create(:guest, event: event)
      get :edit, params: { event_id: event.to_param, id: guest.to_param }
      expect(assigns(:guest)).to eq(guest)
    end

    it "renders the :edit template" do
      guest = create(:guest, event: event)
      get :edit, params: { event_id: event.to_param, id: guest.to_param }
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new guest" do
        expect {
          post :create, params: { event_id: event.id, guest: valid_attributes }
        }.to change(Guest, :count).by(1)
      end

      it "redirects to the created guest" do
        post :create, params: { event_id: event.id, guest: valid_attributes }
        expect(response).to redirect_to(event_guests_path(event))
      end
    end

    context "with invalid params" do
      it "does not create a new guest" do
        expect {
          post :create, params: { event_id: event.id, guest: invalid_attributes }
        }.to_not change(Guest, :count)
      end

      it "renders the new template" do
        post :create, params: { event_id: event.id, guest: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    let(:event) { Event.create(title: "Test Event") }
    let(:guest) { Guest.create(first_name: "Test", last_name: "Guest", email: "testguest@example.com", event: event, affiliation: "Friend", category: "Adult", alloted_seats: 10, commited_seats: 10, guest_commited: 1, status: "Confirmed")}
    context "with valid parameters" do
      it "updates the requested guest" do
        #let(:event) { Event.create(title: "Test Event") }
        #let(:guest) { Guest.create(first_name: "Test", last_name: "Guest", event: event) }
        put :update, params: { event_id: event.to_param, id: guest.to_param, guest: { first_name: "Updated", last_name: "Guest" } }
        guest.reload
        expect(guest.first_name).to eq("Updated")
        expect(guest.last_name).to eq("Guest")
      end

      it "redirects to the guest" do
        put :update, params: { event_id: event.id, id: guest.id, guest: { first_name: "Updated", last_name: "Guest" } }
        expect(response).to redirect_to(event_guest_path(event, guest))
      end
    end

    context "with invalid parameters" do
      it "does not update the guest" do
        put :update, params: { event_id: event.id, id: guest.id, guest: { first_name: nil, last_name: "Guest1" } }
        guest.reload
        expect(guest.first_name).to_not be_nil
        expect(guest.last_name).to_not eq("Guest1")
      end

      it "re-renders the edit method" do
        put :update, params: { event_id: event.id, id: guest.id, guest: { first_name: nil, last_name: "Guest" } }
        expect(response).to render_template(:edit)
      end
    end
  end
  
  describe "DELETE #destroy" do
    # before(:each) do
    #   @event = Event.create(title: "Birthday Party")
    #   @guest = @event.guests.create(first_name: "John", last_name: "Doe", affiliation: "Friend", category: "Adult", alloted_seats: 1, commited_seats: 1, guest_commited: true, status: "Confirmed")
    # end
    let(:event) { Event.create(title: "Test Event") }
    let(:guest) { Guest.create(first_name: "Test", last_name: "Guest", email: "testguest@example.com", event: event, affiliation: "Friend", category: "Adult", alloted_seats: 10, commited_seats: 10, guest_commited: 1, status: "Confirmed")}
    #let(:guest1) { Guest.create(first_name: "Test1", last_name: "Guest", event: event, affiliation: "Friend", category: "Adult", alloted_seats: 10, commited_seats: 10, guest_commited: 1, status: "Confirmed")}
 
    
    it "destroys the requested guest" do
      guest1 = create(:guest, event: event)
      initial_count = Guest.count
      expect {
        delete :destroy, params: { event_id: event.id, id: guest1.id }
      }.to change(Guest, :count).from(initial_count).to(initial_count - 1)
    end

    it "redirects to the guests list" do
      delete :destroy, params: { event_id: event.id, id: guest.id }
      expect(response).to redirect_to(event_guests_path(event))
    end
  end


  describe "before_action :set_guest" do
    #let(:event) { create(:event) }
    #let(:guest) { create(:guest, event: event) }
    let(:event) { Event.create(title: "Test Event") }
    let(:guest) { Guest.create(first_name: "Test", last_name: "Guest", email: "testguest@example.com", event: event, affiliation: "Friend", category: "Adult", alloted_seats: 10, commited_seats: 10, guest_commited: 1, status: "Confirmed")}
    
    
    context "when a valid guest id is provided" do
      before do
        allow(controller).to receive(:params).and_return({ id: guest.id })
        controller.send(:set_guest)
      end

      it "sets the @guest instance variable" do
        guest1 = create(:guest, event: event)
        expect(assigns(:guest1)).to eq(guest1)
      end
    end

    context "when an invalid guest id is provided" do
      it "raises an ActiveRecord::RecordNotFound error" do
        expect do
          allow(controller).to receive(:params).and_return({ id: 0 })
          controller.send(:set_guest)
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end

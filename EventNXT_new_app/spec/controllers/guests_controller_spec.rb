# require 'rails_helper'

# RSpec.describe GuestsController, type: :controller do
#   # Create a parent event to associate with guests
#   let(:event) { create(:event) }

#   describe "GET #index" do
#     it "assigns all guests of the event as @guests" do
#       guest1 = create(:guest, event: event)
#       guest2 = create(:guest, event: event)
#       get :index, params: { event_id: event.to_param }
#       expect(assigns(:guests)).to eq([guest1, guest2])
#     end

#     it "renders the :index template" do
#       get :index, params: { event_id: event.to_param }
#       expect(response).to render_template(:index)
#     end
#   end

#   describe "GET #show" do
#     it "assigns the requested guest as @guest" do
#       guest = create(:guest, event: event)
#       get :show, params: { event_id: event.to_param, id: guest.to_param }
#       expect(assigns(:guest)).to eq(guest)
#     end

#     it "renders the :show template" do
#       guest = create(:guest, event: event)
#       get :show, params: { event_id: event.to_param, id: guest.to_param }
#       expect(response).to render_template(:show)
#     end
#   end

#   describe "GET #new" do
#     it "assigns a new guest as @guest" do
#       get :new, params: { event_id: event.to_param }
#       expect(assigns(:guest)).to be_a_new(Guest)
#     end

#     it "renders the :new template" do
#       get :new, params: { event_id: event.to_param }
#       expect(response).to render_template(:new)
#     end
#   end

#   describe "GET #edit" do
#     it "assigns the requested guest as @guest" do
#       guest = create(:guest, event: event)
#       get :edit, params: { event_id: event.to_param, id: guest.to_param }
#       expect(assigns(:guest)).to eq(guest)
#     end

#     it "renders the :edit template" do
#       guest = create(:guest, event: event)
#       get :edit, params: { event_id: event.to_param, id: guest.to_param }
#       expect(response).to render_template(:edit)
#     end
#   end

#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new guest" do
#         expect {
#           post :create, params: { event_id: event.id, guest: valid_attributes }
#         }.to change(Guest, :count).by(1)
#       end

#       it "redirects to the created guest" do
#         post :create, params: { event_id: event.id, guest: valid_attributes }
#         expect(response).to redirect_to(event_guests_path(event))
#       end
#     end

#     context "with invalid params" do
#       it "does not create a new guest" do
#         expect {
#           post :create, params: { event_id: event.id, guest: invalid_attributes }
#         }.to_not change(Guest, :count)
#       end

#       it "renders the new template" do
#         post :create, params: { event_id: event.id, guest: invalid_attributes }
#         expect(response).to render_template(:new)
#       end
#     end
#   end

#   describe "PUT #update" do
#     let(:event) { Event.create(name: "Test Event") }
#     let(:guest) { Guest.create(first_name: "Test", last_name: "Guest", event: event) }
    
#     context "with valid parameters" do
#       it "updates the requested guest" do
#         put :update, params: { event_id: event.id, id: guest.id, guest: { first_name: "Updated", last_name: "Guest" } }
#         guest.reload
#         expect(guest.first_name).to eq("Updated")
#         expect(guest.last_name).to eq("Guest")
#       end

#       it "redirects to the guest" do
#         put :update, params: { event_id: event.id, id: guest.id, guest: { first_name: "Updated", last_name: "Guest" } }
#         expect(response).to redirect_to(event_guest_path(event, guest))
#       end
#     end

#     context "with invalid parameters" do
#       it "does not update the guest" do
#         put :update, params: { event_id: event.id, id: guest.id, guest: { first_name: nil, last_name: "Guest" } }
#         guest.reload
#         expect(guest.first_name).to_not be_nil
#         expect(guest.last_name).to_not eq("Guest")
#       end

#       it "re-renders the edit method" do
#         put :update, params: { event_id: event.id, id: guest.id, guest: { first_name: nil, last_name: "Guest" } }
#         expect(response).to render_template(:edit)
#       end
#     end
#   end
  
#   describe "DELETE #destroy" do
#     before(:each) do
#       @event = Event.create(name: "Birthday Party", date: "2022-05-05")
#       @guest = @event.guests.create(first_name: "John", last_name: "Doe", affiliation: "Friend", category: "Adult", alloted_seats: 1, commited_seats: 1, guest_commited: true, status: "Confirmed")
#     end
    
#     it "destroys the requested guest" do
#       expect {
#         delete :destroy, params: { event_id: @event.id, id: @guest.id }
#       }.to change(Guest, :count).by(-1)
#     end

#     it "redirects to the guests list" do
#       delete :destroy, params: { event_id: @event.id, id: @guest.id }
#       expect(response).to redirect_to(event_guests_path(@event))
#     end
#   end

#   describe "before_action :set_event" do
#     let(:event) { create(:event) }

#     context "when a valid event id is provided" do
#       before do
#         allow(controller).to receive(:params).and_return({ id: event.id })
#         controller.send(:set_event)
#       end

#       it "sets the @event instance variable" do
#         expect(assigns(:event)).to eq(event)
#       end
#     end

#     context "when an invalid event id is provided" do
#       it "raises an ActiveRecord::RecordNotFound error" do
#         expect do
#           allow(controller).to receive(:params).and_return({ id: 0 })
#           controller.send(:set_event)
#         end.to raise_error(ActiveRecord::RecordNotFound)
#       end
#     end
#   end

#   describe "before_action :set_guest" do
#     let(:guest) { create(:guest) }

#     context "when a valid guest id is provided" do
#       before do
#         allow(controller).to receive(:params).and_return({ id: guest.id })
#         controller.send(:set_guest)
#       end

#       it "sets the @guest instance variable" do
#         expect(assigns(:guest)).to eq(guest)
#       end
#     end

#     context "when an invalid guest id is provided" do
#       it "raises an ActiveRecord::RecordNotFound error" do
#         expect do
#           allow(controller).to receive(:params).and_return({ id: 0 })
#           controller.send(:set_guest)
#         end.to raise_error(ActiveRecord::RecordNotFound)
#       end
#     end
#   end
# end

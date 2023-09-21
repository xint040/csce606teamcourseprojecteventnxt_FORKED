# require 'rails_helper'

# RSpec.describe EventsController, type: :controller do
#   describe "GET #index" do
#     it "returns a success response" do
#       get :index
#       expect(response).to be_successful
#     end
#   end

#   describe "GET #show" do
#     let(:event) { create(:event) }

#     it "returns a success response" do
#       get :show, params: { id: event.to_param }
#       expect(response).to be_successful
#     end

#     context "when the event has a box office spreadsheet uploaded" do
#       let(:event_with_box_office) { create(:event, :with_box_office) }

#       it "loads the box office spreadsheet" do
#         get :show, params: { id: event_with_box_office.to_param }
#         expect(assigns(:event_box_office_data)).not_to be_nil
#       end
#     end
#   end

#   describe "GET #new" do
#     it "returns a success response" do
#       get :new
#       expect(response).to be_successful
#     end
#   end

#   describe "GET #edit" do
#     let(:event) { create(:event) }

#     it "returns a success response" do
#       get :edit, params: { id: event.to_param }
#       expect(response).to be_successful
#     end
#   end

#   describe "POST #create" do
#     context "with valid params" do
#       let(:valid_params) { attributes_for(:event) }

#       it "creates a new event" do
#         expect {
#           post :create, params: { event: valid_params }
#         }.to change(Event, :count).by(1)
#       end

#       it "redirects to the created event" do
#         post :create, params: { event: valid_params }
#         expect(response).to redirect_to(Event.last)
#       end
#     end

#     context "with invalid params" do
#       let(:invalid_params) { attributes_for(:event, title: nil) }

#       it "returns a success response (i.e. to display the 'new' template)" do
#         post :create, params: { event: invalid_params }
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "PUT #update" do
#     let(:event) { create(:event) }

#     context "with valid params" do
#       let(:new_params) { attributes_for(:event, title: "New Title") }

#       it "updates the requested event" do
#         put :update, params: { id: event.to_param, event: new_params }
#         event.reload
#         expect(event.title).to eq("New Title")
#       end

#       it "redirects to the event" do
#         put :update, params: { id: event.to_param, event: new_params }
#         expect(response).to redirect_to(event)
#       end
#     end

#     context "with invalid params" do
#       let(:invalid_params) { attributes_for(:event, title: nil) }

#       it "returns a success response (i.e. to display the 'edit' template)" do
#         put :update, params: { id: event.to_param, event: invalid_params }
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     let(:event) { create(:event) }

#     context "when a valid event id is provided" do
#       it "deletes the event" do
#         expect do
#           delete :destroy, params: { id: event.id }
#         end.to change(Event, :count).by(-1)
#       end

#       it "redirects to the events index page" do
#         delete :destroy, params: { id: event.id }
#         expect(response).to redirect_to(events_path)
#       end

#       it "sets a flash notice message" do
#         delete :destroy, params: { id: event.id }
#         expect(flash[:notice]).to eq("Event was successfully destroyed.")
#       end
#     end

#     context "when an invalid event id is provided" do
#       it "raises an ActiveRecord::RecordNotFound error" do
#         expect do
#           delete :destroy, params: { id: 0 }
#         end.to raise_error(ActiveRecord::RecordNotFound)
#       end
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
# end

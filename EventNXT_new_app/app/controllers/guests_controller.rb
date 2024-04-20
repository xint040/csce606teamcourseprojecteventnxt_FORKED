class GuestsController < ApplicationController
  require 'csv'
  #<!--===================-->
  # <!--corresponding filter of the defined method for nested scaffold-->
  before_action :get_event, except: [:book_seats, :update_commited_seats]
  # <!--===================-->
  
  before_action :set_guest, only: %i[ show edit update destroy ]

  # GET /guests or /guests.json
  def index
    @guests = @event.guests
  end
  
  # GET /guests/1 or /guests/1.json
  def show
    @guests = Guest.all # or another appropriate query to get the guests
  end

  # GET /guests/new
  def new
    # @guest = Guest.new
    
    # <!--===================-->
    # <!--to create a child object that’s associated with the specific parent instance -->
    @guest = @event.guests.build
    # <!--===================-->
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests or /guests.json
  def create
    # @guest = Guest.new(guest_params)
    
    # <!--===================-->
    # <!--to post a new child instance-->
    @guest = @event.guests.build(guest_params)
    # <!--===================-->

    respond_to do |format|
      if @guest.save
        # format.html { redirect_to guest_url(@guest), notice: "Guest was successfully created." }
        format.html { redirect_to event_url(@event), notice: "Guest was successfully created." }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1 or /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        # format.html { redirect_to guest_url(@guest), notice: "Guest was successfully updated." }
        format.html { redirect_to event_path(@event), notice: "Guest was successfully updated." }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /guests/1 or /guests/1.json
  def destroy
    @guest.destroy

    respond_to do |format|
      # format.html { redirect_to guests_url, notice: "Guest was successfully destroyed." }
      format.html { redirect_to event_guests_path(@event), notice: "Guest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:book_seats, :update_commited_seats]

  def book_seats
    @guest = Guest.find_by(rsvp_link: params[:rsvp_link])

    if @guest
      render 'book_seats'
    else
      render plain: 'Invalid RSVP link', status: :not_found
    end
  end

  def update_commited_seats
    @guest = Guest.find_by(rsvp_link: params[:rsvp_link])
  
    if @guest
      new_commited_seats = params[:guest][:commited_seats].to_i
      total_seats = @guest.commited_seats + new_commited_seats
  
      if total_seats <= @guest.alloted_seats
        @guest.commited_seats = total_seats
  
        if @guest.save
          flash[:notice] = 'Committed seats updated successfully.'
          redirect_to book_seats_path(@guest.rsvp_link)
        else
          render 'book_seats'
        end
      else
        flash[:alert] = 'Error: Total seats exceed allocated seats.'
        render 'book_seats'
      end
    else
      render plain: 'Invalid RSVP link', status: :not_found
    end
  end
  
  def import_guests_csv
    event_id = params[:event_id]
    event = Event.find(event_id)

    return redirect_to event_path(@event), alert: "No file uploaded." if params[:file].blank?

  
    # Roo setup to open the Excel file
    file = params[:file]
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1) # Assuming first row is the header
  
    # Iterate over each row
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
  
      first_name = row["First Name"]
      last_name = row["Last Name"]
      email = row["Email"]
      affiliation = row["Affiliation"] # Ensure this column exists in your Excel file
      category = row["Category"] # Ensure this column exists in your Excel file
      alloted_seats = row["Allotted Seats"].to_i # Adjust the key as per your Excel file
      commited_seats = row["Committed Seats"].to_i # Adjust the key as per your Excel file
      #guest_commited = row["Guest Committed"].to_i # Adjust the key as per your Excel file
  
      # Since email is removed, you might want to use a different field to find or initialize guests
      # For example, using first_name and last_name (but ensure these combinations are unique per event)
      guest = Guest.find_or_initialize_by(first_name: first_name, last_name: last_name, event_id: event_id)
      if guest.new_record?
        guest.assign_attributes({
          first_name: first_name,
          last_name: last_name,
          email: email,
          affiliation: affiliation,
          category: category,
          alloted_seats: alloted_seats,
          commited_seats: commited_seats,
          #guest_commited: guest_commited
        })
        guest.save!
      end
    end
  
    redirect_to event_path(event), notice: "Guests imported"
  end
  
  private
  
    # <!--===================-->
    # <!--to create a local @child instance variable-->
    def get_event
      @event = Event.find(params[:event_id])
    end
    
    
    # <!--===================-->
    
    
    
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      # @guest = Guest.find(params[:id])
      
      # <!--===================-->
      # <!--to search for a matching id in the collection of children associated with a particular parent-->
      @guest = Guest.find(params[:id])
      # <!--===================-->
    end

    def model_attribute(header)
      case header.downcase
      when 'first name' then 'first_name'
      when 'last name' then 'last_name'
      # Add other mappings as needed
      else header
      end
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :email, :affiliation, :category, :section, :alloted_seats, :commited_seats, :status, :event_id)
    end
end

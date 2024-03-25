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
  
    begin
      if params[:file].present?
        CSV.foreach(params[:file].path, headers: true, col_sep: "\t") do |row|
          guest_attributes = row.to_hash
          guest_attributes.transform_keys! { |key| key.underscore.gsub(' ', '_') }
  
          # Convert empty strings to nil
          guest_attributes.each do |key, value|
            guest_attributes[key] = value.presence
          end
  
          guest_attributes['event_id'] = event_id
  
          guest = Guest.find_or_initialize_by(
            first_name: guest_attributes['first_name'],
            last_name: guest_attributes['last_name'],
            email: guest_attributes['email'],
            event_id: event_id
          )
          guest.update(guest_attributes)
        end
  
        redirect_to event_guests_path(event_id), notice: 'Guests imported successfully'
      else
        redirect_to event_guests_path(event_id), alert: 'Please upload a CSV file.'
      end
    rescue => e
      redirect_to event_guests_path(event_id), alert: "Failed to import guests: #{e.message}"
    end
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
      params.require(:guest).permit(:first_name, :last_name, :email, :affiliation, :category, :alloted_seats, :commited_seats, :guest_commited, :status, :event_id)
    end
end

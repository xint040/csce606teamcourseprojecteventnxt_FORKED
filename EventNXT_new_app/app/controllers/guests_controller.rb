class GuestsController < ApplicationController
  # <!--===================-->
  # <!--corresponding filter of the defined method for nested scaffold-->
  before_action :get_event
  # <!--===================-->
  
  before_action :set_guest, only: %i[ show edit update destroy ]

  # GET /guests or /guests.json
  def index
    # @guests = Guest.all
    
    # <!--===================-->
    # <!--to return all children instances associated with a particular parent instance-->
    @guests = @event.guests
    # <!--===================-->
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
        format.html { redirect_to event_guests_url(@event), notice: "Guest was successfully created." }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1 or /guests/1.json
  def update
    puts "iuyiuyiuyyiuyiuyiyiyiyiyiyi------------"
    respond_to do |format|
      if @guest.update(guest_params)
        # format.html { redirect_to guest_url(@guest), notice: "Guest was successfully updated." }
        format.html { redirect_to event_guest_path(@event), notice: "Guest was successfully updated." }
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
    puts "!!!!!!!!!!!!--------------"

    respond_to do |format|
      # format.html { redirect_to guests_url, notice: "Guest was successfully destroyed." }
      format.html { redirect_to event_guests_path(@event), notice: "Guest was successfully destroyed." }
      format.json { head :no_content }
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
      @guest = @event.guests.find(params[:id])
      # <!--===================-->
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :affiliation, :category, :alloted_seats, :commited_seats, :guest_commited, :status, :event_id)
    end
end

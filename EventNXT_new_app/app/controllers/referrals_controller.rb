class ReferralsController < ApplicationController
  #before_action :set_guest
  #before_action :set_referral, only: %i[ edit update ]
  
  
    def new

    end

    def create
      friend_email = params[:friend_email]
      ref_code = params[:ref_code]
      event_id = params[:event_id]
      @event = Event.find_by(id: event_id)
      @guest = Event.guests.find_by(id: ref_code)
      @referral = Referral.create(guest_id: ref_code, email: @guest.email, name: '#{@guest.first_name} #{@guest.last_name}', referred: friend_email, ref_code: ref_code)          
      if @referral.save
         UserMailer.referral_confirmation(friend_email).deliver_now
      end
      respond_to do |format|
        format.html { head :no_content }
        format.js 
      end
    end

    before_action :authenticate_user!

  # GET /referrals/1/edit
    def edit

    end

  # PATCH/PUT /referrals/1 or /referrals/1.json
    def update
      @referral = Referral.find(params[:id])
      if @referral.reward_method == 'reward/ticket'
        #the_referral_parametrization = {
        #   email: @referral.email, 
        #   name: @referral.name, 
        #   referred: @referral.referred, 
        #   status: @referral.status, 
        #   tickets: @referral.tickets, 
        #   amount: @referral.amount, 
        #   reward_method: 'reward/ticket', 
        #   reward_input: params[:reward_input], 
        #   reward_value: params[:reward_input] * tickets,
        #   guest_id: @guest.id,
        #   ref_code: @guest.id
        #  }
        @referral.update(:reward_value => (params[:reward_input] * @referral.tickets))
      elsif @referral.reward_method == 'reward percentage %'
        #the_referral_parametrization = {
        #   email: @referral.email, 
        #   name: @referral.name, 
        #   referred: @referral.referred, 
        #   status: @referral.status, 
        #   tickets: @referral.tickets, 
        #   amount: @referral.amount, 
        #   reward_method: 'reward percentage %', 
        #   reward_input: params[:reward_input], 
        #   reward_value: ((@referral.amount) * params[:reward_input]) / 100,
        #   guest_id: @guest.id,
        #   ref_code: @guest.id
        #  }
      end
      @referral.update(:reward_value => ((@referral.amount) * params[:reward_input]) / 100)
    end

    private
     
    #def set_guest
    #  @guest = Guest.find(params[:guest_id])
    #end

    # Use callbacks to share common setup or constraints between actions.
    #def set_referral
    #  @referral = @guest.referrals.find(params[:id])
    #end

    # Only allow a list of trusted parameters through.
    def referral_params
      params.require(:referral).permit(:guest_id, :email, :name, :referred, :status, :tickets, :amount, :reward_method, :reward_input, :ref_code)
    end
end

  
  
  

  
  
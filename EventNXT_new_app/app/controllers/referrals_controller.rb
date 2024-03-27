class ReferralsController < ApplicationController
    
  
    def new

    end



    def create
      friend_email = params[:friend_email]
      ref_code = params[:ref_code]

      UserMailer.referral_confirmation(friend_email).deliver_now

      @referral = Referral.create(guest_id: guest.id, email: guest.email, name: '#{guest.first_name} #{guest.last_name}', referred: friend_email, ref_code: ref_code)
      @referral.save

      respond_to do |format|
        format.html { head :no_content }
        format.js 
      end
    end
  end
  
  
  

  
  
class ReferralsController < ApplicationController
    
  
    def new

    end



    def create
      friend_email = params[:friend_email]
      ref_code = params[:ref_code]

      UserMailer.referral_confirmation(friend_email).deliver_now

      @referral = Referral.find_by(ref_code: ref_code)
      
      @referral.update(referred: friend_email)

      respond_to do |format|
        format.html { head :no_content }
        format.js 
      end
    end
  end
  
  
  

  
  
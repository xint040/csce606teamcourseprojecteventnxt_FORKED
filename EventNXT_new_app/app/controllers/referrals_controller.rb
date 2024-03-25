class ReferralsController < ApplicationController
    def create
      friend_email = params[:friend_email]

      UserMailer.referral_confirmation(friend_email).deliver_now
  
      respond_to do |format|
        format.html { head :no_content }
        format.js 
      end
    end
  end
  
  
  

  
  
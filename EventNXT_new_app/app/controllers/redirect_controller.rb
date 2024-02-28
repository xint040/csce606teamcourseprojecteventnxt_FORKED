class RedirectController < ApplicationController
    def after_signout
      redirect_to "https://events360.herokuapp.com/signout", allow_other_host: true
    end
  end
  
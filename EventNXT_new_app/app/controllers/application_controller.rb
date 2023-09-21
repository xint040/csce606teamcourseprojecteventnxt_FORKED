class ApplicationController < ActionController::Base
    # <!--===================-->
    # <!--Devise helper to avoid unauthorized access-->
    before_action :authenticate_user!
    # <!--===================-->
end

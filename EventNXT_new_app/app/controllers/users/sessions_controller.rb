class Users::SessionsController < Devise::SessionsController
    protected
  
    def after_sign_out_path_for(resource_or_scope)
        redirect_after_signout_path # An internal route
    end
  end
  
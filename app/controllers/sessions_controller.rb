class SessionsController < Devise::SessionsController  
  respond_to :json, :js
end

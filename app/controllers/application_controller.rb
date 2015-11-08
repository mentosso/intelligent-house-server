class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  skip_before_filter :verify_authenticity_token
  respond_to :json

  protected

  def authenticate_user!
    if user_signed_in?
      super
    end
  end
end

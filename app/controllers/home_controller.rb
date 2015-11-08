class HomeController < ApplicationController
  before_action :authenticate_user!, except: :check
  respond_to :json

  def index
  end

  def check
    render json: user_signed_in?
  end
end

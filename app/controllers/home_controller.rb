class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  respond_to :json

  def index
  end
end

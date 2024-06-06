class PlacesController < ApplicationController
  before_action :set_user, only: [:show, :new]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @places = Place.all
  end

  def home
    redirect_to "/places"
  end

  def show
    @user = User.find_by({ "id" => session["user_id"] })
    @place = Place.find_by({ "id" => params["id"] })
    if @user != nil
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @user["id"]})
    else
      flash["notice"] = "Please login."
      redirect_to "/login"
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

  private

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def place_params
    params.require(:place).permit(:name)
  end
end

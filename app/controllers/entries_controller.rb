class EntriesController < ApplicationController

  def new
  end

  def create
      @user = User.find_by({ "id" => session["user_id"] })
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = @user["id"]
      @entry.uploaded_image.attach(params["uploaded_image"])
      @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
    else
      flash["notice"] = "Login first."
  end
  redirect_to "/places"
  
  before_action :allow_cors
  def allow_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
    response.headers['Access-Control-Max-Age'] = '1728000'
  end

end

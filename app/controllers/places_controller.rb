class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
    @user = User.find_by({ "email" => params["email"] })
    @sessionid = session["user_id"]
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["place"]["name"]
      @place["user_id"] = params["user"]["id"]
      @place.save
    else
      flash["notice"] = "Please login first."
    end
      redirect_to "/places"
  end

end

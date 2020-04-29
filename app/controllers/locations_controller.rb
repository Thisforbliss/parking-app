class LocationsController < ApplicationController

get "/locations" do
  @spot_info = Location.all
  erb :"/locations/index.html"
end

# GET: /contents/new
get "/locations/new" do
  if Helpers.is_logged_in?(session)
    erb :"/locations/new.html"
  else
    redirect "/login"
  end
end

post "/locations" do
  # user = Helpers.current_user(session)
  # if params["location"].empty?
  #   flash[:empty_space] = "Fill in the space"
  #   redirect to '/locations/new'
  # else
    location = Location.create(:coordinates => params[:coordinates])
    redirect '/locations'
  # end
end

get "/locations/:id" do
    @location = Location.find(params[:id])
    erb :"/locations/show.html"
end

end

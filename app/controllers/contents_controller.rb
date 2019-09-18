class ContentsController < ApplicationController

  # GET: /contents
  get "/contents" do
    @spot_info = Content.all
    erb :"/contents/index.html"
  end

  # GET: /contents/new
  get "/contents/new" do
    erb :"/contents/new.html"
  end

  # POST: /contents
  post "/contents" do
  user = Helpers.current_user(session)
  if params["location"].empty? || params["license_plate"].empty? ||  params["model"].empty?
    flash[:empty_tweet] = "Fill in the Tweet"
    redirect to '/contents/new'
  else
  content = Content.create(:car_location => params[:location], :license_plate => params["license_plate"], :car_model => params["model"], :user_id => user.id)
  redirect to '/contents'
  end
  end


  # GET: /contents/5
  get "/contents/:id" do
    erb :"/contents/show.html"
  end

  # GET: /contents/5/edit
  get "/contents/:id/edit" do
    @content = Content.find(params[:id])
    if !Helpers.is_logged_in?(session)
    redirect to '/login'
    elsif Helpers.current_user(session).id != @content.user_id
      flash[:wrong_user_edit] = "You could only edit your own tweets"
      redirect to '/contents'
    else
      @content = Content.find(params[:id])
      erb :"/contents/edit.html"
  end

  # PATCH: /contents/5
  patch "/contents/:id" do
    redirect "/contents/:id"
  end

  # DELETE: /contents/5/delete
  delete "/contents/:id/delete" do
    redirect "/contents"
  end
end

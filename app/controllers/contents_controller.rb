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
  content = Content.create(:car_location => params[:location], :license_plate => params["license_plate"], :car_model => params["model"], :driver_id => user.id)
  redirect to '/contents'
  end
  end


  # GET: /contents/5
  get "/contents/:id" do #why does it revert me to the log in page every time I have lines 29-30 open?
    # if !Helpers.is_logged_in?(session)
    #   redirect to '/login'
    # else
      @content = Content.find(params[:id])
      erb :"/contents/show.html"
    #end
  end

  # GET: /contents/5/edit
  get "/contents/:id/edit" do
    @content = Content.find(params[:id])
    #binding.pry
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    elsif Helpers.current_user(session).id != @content.driver_id
      flash[:wrong_user_edit] = "You could only edit your own tweets"
      redirect to '/contents'
    else
      @content = Content.find(params[:id])
      erb :"/contents/edit.html"
    end
  end

  # PATCH: /contents/5
  patch "/contents/:id" do
    content = Content.find(params[:id])
    if params["location"].empty? ||params["license_plate"].empty? || params["model"].empty?
      flash[:empty_content] = 'Please fill in the blank'
      redirect to "/contents/#{params[:id]}/edit"
    end
    content.update(:car_location => params["location"], :license_plate => params["license_plate"], :car_model => params["model"])
    content.save
    redirect to "/contents"
  end

  # DELETE: /contents/5/delete
  delete '/contents/:id/delete' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    end
    @content = Content.find(params[:id])
    if Helpers.current_user(session).id == @content.driver_id
  #flash[:wrong_user] = "You could only delete your own tweets"
#end
  @content.delete
  end
  redirect to '/contents'
  end

end

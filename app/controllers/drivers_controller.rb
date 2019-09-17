class DriversController < ApplicationController

  get "/signup" do
    erb :"drivers/signup.html"
  end

#currently working on the post signup and entering correct params

  post "/signup" do
    params.each do |label, input|
    if input.empty?
      flash[:new_user_error] = "Please fill in #{label}."
      redirect '/signup'
    end
    end
   driver = Driver.create(username: params["username"], phone_number: params["phone_number"], password: params["password"])
   session[:user_id] = driver.id
   redirect "/contents"
   if Helpers.is_logged_in?
   end
  end

  get '/login' do
      if Helpers.is_logged_in?(session)
        redirect to '/contents'
      end
      erb :"drivers/login.html"
    end

    post '/login' do
      driver = Driver.find_by(:username => params["username"])
       if driver && driver.authenticate(params["password"])
         session[:user_id] = driver.id
         redirect to '/contents'
       else
         flash[:login_error] = "Incorrect username and/or password. Please try again"
         redirect to '/login'
       end
    end














  # GET: /drivers
  get "/drivers" do
    erb :"/drivers/index.html"
  end

  # GET: /drivers/new
  get "/drivers/new" do
    erb :"/drivers/new.html"
  end

  # POST: /drivers
  post "/drivers" do
    redirect "/drivers"
  end

  # GET: /drivers/5
  get "/drivers/:id" do
    erb :"/drivers/show.html"
  end

  # GET: /drivers/5/edit
  get "/drivers/:id/edit" do
    erb :"/drivers/edit.html"
  end

  # PATCH: /drivers/5
  patch "/drivers/:id" do
    redirect "/drivers/:id"
  end

  # DELETE: /drivers/5/delete
  delete "/drivers/:id/delete" do
    redirect "/drivers"
  end
end

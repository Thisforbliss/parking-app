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
    redirect "/contents"
  end

  # GET: /contents/5
  get "/contents/:id" do
    erb :"/contents/show.html"
  end

  # GET: /contents/5/edit
  get "/contents/:id/edit" do
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

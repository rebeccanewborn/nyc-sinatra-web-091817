class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do
    figure=Figure.create(params["figure"])


    if !params["title"]["name"].empty?
      title=Title.create(name: params["title"]["name"])
      figure.titles << title
    end


    if !params["landmark"]["name"].empty?
      landmark=Landmark.create(name: params["landmark"]["name"])
      figure.landmarks << landmark
    end

    figure.save
  end


  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end


  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do

    # binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["title"]["name"].empty?
      title=Title.create(name: params["title"]["name"])
      @figure.titles << title
    end


    if !params["landmark"]["name"].empty?
      landmark=Landmark.create(name: params["landmark"]["name"])
      @figure.landmarks << landmark
    end

    figure.save
  end


end

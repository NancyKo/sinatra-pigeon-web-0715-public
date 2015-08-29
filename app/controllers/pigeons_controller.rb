# create your PigeonsController here
# it should inherit from ApplicationController

class PigeonsController < ApplicationController 

  get '/pigeons' do
    @pigeon = Pigeon.all 
    erb :'/pigeons/index'
  end

  get '/pigeons/new' do
    erb :'/pigeons/new'
  end

  get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    erb :'/pigeons/show'
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find(params[:id])
    erb :'/pigeons/edit'
  end

  patch '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    # binding.pry
    @pigeon.update(name: params[:name], color: params[:color], gender: params[:gender], lives: params[:lives])  
    redirect :"/pigeons/#{@pigeon.id}"
  end

  post '/pigeons' do
    @pigeon = Pigeon.create(params)
    redirect :'/pigeons'
  end

  delete '/pigeons/:id' do 
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect :'/pigeons'
  end

end
class WishListController < ApplicationController
 
  get '/home' do
    @user = current_user
    erb :'/wishlist/home'
  end

  get '/wishlist/new' do 
    erb :'wishlist/new' 
  end

  post '/wishlist/new' do 
    @wishlist = WishList.new(:name => params[:name])
    redirect 'wishlist/show'
  end

  get '/wishlist/show' do
    erb :'wishlist/show'
  end

end
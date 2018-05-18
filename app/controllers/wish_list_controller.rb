class WishListController < ApplicationController
 
  get '/home' do
    @user = current_user
    erb :'/wishlist/home'
  end

  get '/wishlist/new' do 
    erb :'wishlist/new' 
  end

  post '/wishlist/new' do 
    wishlist = current_user.wish_lists.build(:name => params[:name])
    wishlist.save
    redirect "wishlist/show/#{wishlist.id}" 
  end

  get '/wishlist/show/:id' do
    @wishlist = WishList.find_by_id(params[:id])
    @items = @wishlist.items
    erb :'wishlist/show'
  end

end
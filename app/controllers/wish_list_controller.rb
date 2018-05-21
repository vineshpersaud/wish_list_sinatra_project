class WishListController < ApplicationController
 
  get '/wishlists' do 
    @user = current_user.username
    @wishlists = current_user.wish_lists.all
    erb :'users/wishlists'
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


  post '/wishlist/:id/delete' do #delete action
    @wishlist = WishList.find_by_id(params[:id])
    @wishlist.delete
    redirect '/wishlists'
  end

end
class WishListController < ApplicationController
 
  get '/home' do
    @user = current_user
    erb :'/wishlist/home'
  end

end
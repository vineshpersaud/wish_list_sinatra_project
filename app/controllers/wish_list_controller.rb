class WishListController < ApplicationController



  get "/" do
    if logged_in?
      redirect '/wishlists' 
    else
      erb :'wishlist/home'
    end
  end
 
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
    if wishlist.save
      redirect "wishlist/show/#{wishlist.id}" 
    else
      flash[:message] = "Please enter name for Wishlist."
      redirect '/wishlist/new'
    end
  end

  get '/wishlist/show/:id' do
    @wishlist = WishList.find_by_id(params[:id])
    @items = @wishlist.items
    erb :'wishlist/show'
  end


  delete '/wishlist/:id/delete' do
    @wishlist = WishList.find_by_id(params[:id])
    if logged_in?
      if @wishlist && @wishlist.user_id == current_user.id 
        @wishlist.delete
        flash[:message] = "Wishlist successfully deleted."
        redirect '/wishlists'
      end
    else
      redirect "wishlist/show/#{@wishlist.id}" 
    end
  end

   get '/wishlist/:id/edit' do 
      if @wishlist && @wishlist.user_id == current_user.id && logged_in?
        @wishlist = WishList.find_by_id(params[:id])
        erb :'wishlist/edit'
    else
      redirect '/'
    end
  end
  

  patch '/wishlist/:id' do
    @wishlist = WishList.find_by_id(params[:id]) 
      if logged_in?
        if @wishlist && @wishlist.user_id == current_user.id 
          @wishlist.name = params[:name]
          @wishlist.save
          flash[:message] = "Wishlist name successfully updated."
          redirect "/wishlist/show/#{@wishlist.id}"
        end
      else
        redirect "wishlist/show/#{@wishlist.id}" 
      end
  end      

end
class ItemController < ApplicationController 


  post '/item/new' do
    @wishlist = WishList.find_by_id(params[:wishlist_id])
    if logged_in?
      if @wishlist && current_user.id == @wishlist.user_id 
        item = @wishlist.items.build(:name => params[:item],:quantity => params[:quantity],:price => params[:price])
        item.save
        if item.errors.include?(:name)
          flash[:alert] = "Item must have name."
        end
      redirect "wishlist/show/#{@wishlist.id}" 
      end  
    end
    redirect "wishlist/show/#{@wishlist.id}" 
  end

  delete '/item/:id/delete' do #delete action
    @item = Item.find_by_id(params[:id])
    @wishlist = @item.wish_list_id
    if logged_in?
      if current_user.id == WishList.find_by_id( @item.wish_list_id).user_id
        @item.delete
        flash[:message] = "Item successfully deleted."
        redirect "/wishlist/show/#{@wishlist}"
      end
    end
  end

  get '/items/:id/edit' do 
    @item = Item.find_by_id(params[:id])
    erb :'items/edit'
  end

  patch '/items/:id' do 
    @item = Item.find_by_id(params[:id])
     if logged_in?
       if current_user.id == WishList.find_by_id( @item.wish_list_id).user_id
          @item = Item.find_by_id(params[:id])
          @item.name = params[:item]
          @item.quantity = params[:quantity]
          @item.price = params[:price]
          @item.save
          flash[:message] = "Item Successfully updated"
          redirect "/wishlist/show/#{@item.wish_list_id}"
        end
      end
  end

end

class ItemController < ApplicationController 

  post '/item/new' do
    @wishlist = WishList.find_by_id(params[:wishlist_id])
    if logged_in?
      if current_user.id == @wishlist.id && @wishlist
        item = @wishlist.items.build(:name => params[:item],:quantity => params[:quantity],:price => params[:price])
        item.save
      end
      if item.errors.include?(:name)
        flash[:alert] = "Item must have name."
      end
    else
      redirect "wishlist/show/#{@wishlist.id}" 
    end

  end

  post '/item/:id/delete' do #delete action
    @item = Item.find_by_id(params[:id])
    @wishlist = @item.wish_list_id
    @item.delete
    flash[:message] = "Item successfully deleted."
    redirect "/wishlist/show/#{@wishlist}"
  end

end

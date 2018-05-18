class ItemController < ApplicationController 

  post '/item/new' do
    @wishlist = WishList.find_by_id(params[:wishlist_id])
    item = @wishlist.items.build(:name => params[:item])
    item.save
    redirect "wishlist/show/#{@wishlist.id}" 
  end
end

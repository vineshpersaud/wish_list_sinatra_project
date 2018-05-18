class UserController < ApplicationController 

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/home'
    end
  end

  get '/wishlists' do 
    @user = current_user.username
    @wishlists = current_user.wish_lists.all
    erb :'users/wishlists'
  end

end

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
      redirect to '/wishlist'
    end

  end

  get '/login' do
    erb :'users/login'
  end

  get '/wishlist' do
    erb :'users/wishlist'
  end
end

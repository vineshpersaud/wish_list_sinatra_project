require 'rack-flash'


class SessionsController < ApplicationController 
    use Rack::Flash

  get '/login' do
    erb :'users/login'
  end

  post '/sessions/login' do  
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @user = user.username
      redirect  '/wishlists'
    else
      redirect  '/signup'
    end
  end


  get '/sessions/logout' do 
    flash[:message] = "Item successfully deleted."
    session.clear 
    erb :'wishlist/home'
  end

end

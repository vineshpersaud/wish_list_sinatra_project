class SessionsController < ApplicationController 
  


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
      flash[:alert] = "Login information incorrect signup below."
      redirect  '/signup'
    end
  end


  get '/sessions/logout' do 
    flash[:message].now = "You have successfully logged out."
    session.clear 
    erb :'wishlist/home'
  end

end

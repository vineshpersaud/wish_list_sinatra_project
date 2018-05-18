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

  get '/login' do
    erb :'users/login'
  end

  post '/login' do  
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @user = user.username
      redirect to '/home'
    else
      redirect to '/signup'
    end
  end


  get '/sessions/logout' do 
    session.clear
  end

end

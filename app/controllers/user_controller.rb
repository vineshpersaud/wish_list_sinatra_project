require 'rack-flash'


class UserController < ApplicationController 
use Rack::Flash

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do 

    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    @user.save
    if @user.errors.any?
      flash[:alert] = "Please fill all fields"
      redirect to '/signup'
    else
      session[:user_id] = @user.id
      redirect to '/wishlists'
    end
  end



end

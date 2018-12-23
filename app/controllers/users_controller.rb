class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do
    if !!User.find_by(username: params[:username], email: params[:username])
      redirect "/login"
    else
      @user = User.create(params)
      redirect "/users/#{@user.slug}"
    end
  end

  get '/login' do
    erb :"/users/login"
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/goals"
    else
      redirect "/signup"
    end

  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/home"
  end

end

class UsersController < ApplicationController

  get '/signup' do
    if logged_in?(session)
      redirect "/users"
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    if params.values.any? &:empty?
      redirect "/signup"
      ## raise error
    elsif !!User.find_by(username: params[:username], email: params[:email])
      redirect "/login"
      ## raise error
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    end
  end

  get '/login' do
    if logged_in?(session)
      redirect "/users"
    else
      erb :"/users/login"
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users"
    else
      redirect "/signup"
    end

  end

  get '/users' do
    if logged_in?(session)
      redirect "/users/#{current_user.slug}"
    else
      redirect "/login"
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/home"
  end

  get '/users/:slug/favorites' do
    @user = current_user
    erb :"/users/show_favorites"
  end

  get '/users/:slug/logout' do
    logout!
    redirect "/"
  end


end

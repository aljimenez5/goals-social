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
    if current_user.id == User.find_by_slug(params[:slug]).id
      @user = current_user
      erb :"/users/show_favorites"
    else
      redirect "/users/#{current_user.slug}"
    end
  end
 
  post '/users/:slug/favorites' do
    goal = Goal.find(params[:favorite_goal_id].to_i)
    current_user.favorites << goal
    redirect "/users/#{current_user.slug}/favorites"
  end

  delete '/users/:slug/favorites/delete' do
    if current_user == User.find_by_slug(params[:slug])
      favorite_goal = FavoriteGoal.find(params[:favorite_goal_id].to_i)
      favorite_goal.destroy
      redirect "/users/#{current_user.slug}/favorites"
    else
      redirect "/users/#{current_user.slug}/favorites"
    end
  end

  get '/users/:slug/logout' do
    logout!
    redirect "/"
  end




end

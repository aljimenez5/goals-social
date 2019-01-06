class UsersController < ApplicationController

  get '/signup' do
    if logged_in?(session)
      redirect "/users/#{current_user.slug}"
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    if params.values.any? &:empty?
      flash[:message] = "All fields are required."
      redirect "/signup"
    elsif !User.exists?(email: params[:email].strip) && !User.exists?(username: params[:username].strip) && !User.exists?(email: params[:email].strip.downcase) && !User.exists?(username: params[:username].strip.downcase)
      new_params = downcase_strip_params(params)
      @user = User.create(new_params)
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Username and/or Email already exists."
      redirect "/login"
    end
  end

  get '/login' do
    if logged_in?(session)
      redirect "/users/#{current_user.slug}"
    else
      erb :"/users/login"
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if params.values.any? &:empty?
      flash[:message] = "All fields are required."
      redirect "/login"
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{current_user.slug}"
    elsif @user && !@user.authenticate(params[:password]) || !@user
      flash[:message] = "Wrong email and/or password."
      redirect "/login"
    else
      flash[:message] = "Unable to complete request. Please try again."
      redirect "/login"
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
    if !logged_in?(session)
      redirect "/login"
    elsif current_user.id == User.find_by_slug(params[:slug]).id
      @user = current_user
      erb :"/users/show_favorites"
    else
      flash[:message] = "Unable to see other users' favorites."
      redirect "/users/#{current_user.slug}"
    end
  end

  post '/users/:slug/favorites' do
    goal = Goal.find(params[:favorite_goal_id].to_i)
    current_user.favorites << goal
    redirect "/users/#{current_user.slug}/favorites"
  end

  get '/users/:slug/favorites/delete' do
    redirect "/users/#{params[:slug]}"
  end

  delete '/users/:slug/favorites' do
    if current_user == User.find_by_slug(params[:slug])
      favorite_goal = FavoriteGoal.find(params[:favorite_goal_id].to_i)
      favorite_goal.destroy
      redirect "/users/#{current_user.slug}/favorites"
    else
      redirect "/users/#{current_user.slug}/favorites"
    end
  end

  get '/users/:slug/logout' do
    if current_user != User.find_by_slug(params[:slug])
      redirect "/users/#{current_user.slug}"
    else
      logout!
      redirect "/"
    end
  end


end

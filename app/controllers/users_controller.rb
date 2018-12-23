class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do
    @user = User.create(params)
    redirect "/users/#{@user.slug}"
  end

  get '/login' do
    erb :"/users/login"
  end

end

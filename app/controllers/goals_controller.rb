class GoalsController < ApplicationController

  get '/goals' do
    if logged_in?(session)
      @goals = Goal.all
      erb :"/goals/home"
    else
      redirect "/login"
    end
  end

  get '/goals/:id' do 
    @goal = Goal.find(params[:id])
    erb :"/goals/show"
  end
end

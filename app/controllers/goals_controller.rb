class GoalsController < ApplicationController

  get '/goals' do
    @goals = Goal.all
    erb :"/goals/home"
  end

  get '/goals/:id' do
    @goal = Goal.find(params[:id])
    erb :"/goals/show"
  end
end

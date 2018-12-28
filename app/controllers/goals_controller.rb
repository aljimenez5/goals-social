class GoalsController < ApplicationController

  get '/goals' do
    @goals = Goal.all
    erb :"/goals/home"
  end

  get '/goals/new' do
    erb :"/goals/new"
  end

  post '/goals/new' do
    goal = Goal.create(params[:goal])
    current_user.goals << goal
    params[:steps].each do |step|
      goal.steps << Step.create(params[:steps][step[0].to_sym])
    end
  end

  get '/goals/:id' do
    @goal = Goal.find(params[:id])
    erb :"/goals/show"
  end



end

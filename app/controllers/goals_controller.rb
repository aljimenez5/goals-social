class GoalsController < ApplicationController

  get '/goals' do
    @goals = Goal.all
    @favorited_goal = FavoriteGoal.find_by(user_id: current_user.id, goal_id: goal.id)
    erb :"/goals/home"
  end

  get '/goals/new' do
    erb :"/goals/new"
  end

  post '/goals/new' do
    @goal = Goal.create(params[:goal])
    current_user.goals << @goal
    params[:steps].each do |step|
      @goal.steps << Step.create(params[:steps][step[0].to_sym]) unless params[:steps][step[0].to_sym][:content].empty?
    end
    redirect "/users/#{current_user.slug}"
  end

  get '/goals/:id' do
    @goal = Goal.find(params[:id])
    erb :"/goals/show"
  end

  get '/goals/:id/edit' do
    @goal = Goal.find(params[:id])
    if current_user.id == @goal.user_id
      erb :"/goals/edit"
    else
      redirect "/goals/#{@goal.id}"
    end
  end

  patch '/goals/:id/edit' do
    @goal = Goal.find(params[:id])
    if current_user.id == @goal.user_id
      @goal.update(params[:goal])
      params[:steps].each do |step|
        @step_obj = Step.find(step[0].to_i)
        if !params[:steps][step[0].to_sym][:content].empty?
          @step_obj.update(params[:steps][step[0].to_sym]) || @goal.steps << Step.create(params[:steps][step[0].to_sym])
        elsif params[:steps][step[0].to_sym][:content].empty?
          @step_obj.destroy
        end
      end
      redirect "/goals/#{@goal.id}"
    end
  end


end

class GoalsController < ApplicationController

  get '/goals' do
    @goals = Goal.all
    erb :"/goals/home"
  end

  get '/goals/new' do
    if !logged_in?(session)
      flash[:message] = "Please log in before creating a goal."
      redirect "/login"
    else
      erb :"/goals/new"
    end
  end

  post '/goals' do
    if params[:goal].values.any? &:empty?
      flash[:message] = "Title and content fields are required."
      redirect "/goals/new"
    elsif !!Goal.find_by(title: params[:goal][:title], content: params[:goal][:content])
      flash[:message] = "Goal already exists."
      redirect "/users/#{current_user.slug}"
    else
      @goal = Goal.create(params[:goal])
      current_user.goals << @goal
      params[:steps].each do |step|
        @goal.steps << Step.create(params[:steps][step[0].to_sym]) unless params[:steps][step[0].to_sym][:content].empty?
      end
      redirect "/users/#{current_user.slug}"
    end
  end

  get '/goals/:id' do
    @goal = Goal.find(params[:id])
    erb :"/goals/show"
  end

  get '/goals/:id/edit' do
    @goal = Goal.find(params[:id])
    if !logged_in?(session)
      redirect "/login"
    elsif current_user.id == @goal.user_id
      erb :"/goals/edit"
    else
      flash[:message] = "Cannot edit someone else's goal."
      redirect "/goals/#{@goal.id}"
    end
  end

  patch '/goals/:id' do
    @goal = Goal.find(params[:id])
    if current_user.id != @goal.user_id
      redirect "/users/#{current_user.slug}"
    elsif params[:goal].values.any? &:empty?
      flash[:message] = "Title and content fields are required."
      redirect "/goals/#{@goal.id}"
    elsif current_user.id == @goal.user_id
      @goal.update(params[:goal])
      params[:steps].each do |step|
        if !params[:steps][step[0].to_sym][:content].empty? && Step.exists?(step[0])
          @step_obj = Step.find(step[0])
          @step_obj.update(params[:steps][step[0].to_sym])
        elsif !params[:steps][step[0].to_sym][:content].empty? && !Step.exists?(step[0])
          @new_step_obj = Step.create(params[:steps][step[0].to_sym])
          @goal.steps << @new_step_obj
        elsif params[:steps][step[0].to_sym][:content].empty? && Step.exists?(step[0])
          Step.find(step[0]).destroy
        end

      end
      flash[:message] = "Goal successfully updated."
      redirect "/goals/#{@goal.id}"
    end
  end

  delete '/goals/:id' do
    if current_user == Goal.find(params[:id]).user
      goal = Goal.find(params[:delete_click])
      goal.destroy
      flash[:message] = "Deleted successfully."
      redirect "/users/#{current_user.slug}"
    else
      flash[:message] = "Unable to delete."
      redirect "/goals/#{params[:id].to_i}"
    end
  end


end

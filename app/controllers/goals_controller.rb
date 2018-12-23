class GoalsController < ApplicationController

  get '/goals' do
    @goals = Goal.all
    erb :"/goals/home"
  end
end

require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Flash, :sweep => true
    enable :sessions
    set :session_secret, "secret_goals_steps"
  end

  helpers do
    def logged_in?(session)
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def logout!
      session.clear
    end

  end

  get '/' do
    erb :'index'
  end


end
